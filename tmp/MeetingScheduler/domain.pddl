(define (domain integrated-meeting-scheduling)
  (:requirements :typing :negative-preconditions :universal-preconditions :existential-preconditions)
  (:types person slot)

  (:predicates
    ;; Common/time predicates
    (next ?s1 - slot ?s2 - slot)             ; adjacency inside each participant's slot namespace
    (same-slot ?s1 - slot ?s2 - slot)        ; explicit mapping between slot names from different inputs

    ;; Participant A (Michelle) - kept distinct from others
    (available_p1 ?p - person ?s - slot)     ; corresponds to original (available ?p ?s)
    (scheduled_p1 ?s - slot)                 ; result of Michelle's local schedule action

    ;; Participant B (Steven) - kept distinct
    (slot_steven ?s - slot)                  ; Steven's domain declared slots
    (free_steven ?s - slot)                  ; corresponds to Steven's (free ?s)
    (meeting-scheduled-steven)               ; Steven-local meeting scheduled flag
    (meeting-at-steven ?s - slot)            ; Steven-local meeting start

    ;; Participant C (third input) - kept distinct
    (available_p3 ?s - slot)                 ; corresponds to the third input's (available ?s)
    (meeting-scheduled-p3)                   ; p3-local meeting scheduled flag
    (meeting_start_p3 ?s - slot)             ; p3-local meeting start

    ;; Global/orchestrator predicates
    (meeting_scheduled_global)               ; true once global meeting is scheduled
    (meeting_start_at ?s - slot)             ; global meeting start (uses one participant's slot name)
  )

  ;; Michelle's original scheduling action (kept distinct)
  (:action schedule_michelle
    :parameters (?start - slot ?next - slot)
    :precondition (and
      (next ?start ?next)
      ;; original required availability for all persons; keep quantifier semantics
      (forall (?p - person)
        (and (available_p1 ?p ?start)
             (available_p1 ?p ?next)))
    )
    :effect (scheduled_p1 ?start)
  )

  ;; Steven's original scheduling action (kept distinct and renamed)
  (:action schedule_steven
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (slot_steven ?s)
      (slot_steven ?s2)
      (next ?s ?s2)
      (free_steven ?s)
      (free_steven ?s2)
      (not (meeting-scheduled-steven))
    )
    :effect (and
      (not (free_steven ?s))
      (not (free_steven ?s2))
      (meeting-scheduled-steven)
      (meeting-at-steven ?s)
    )
  )

  ;; Participant C's original-style scheduling action (kept distinct)
  (:action schedule_p3
    :parameters (?t1 - slot ?t2 - slot)
    :precondition (and
      (next ?t1 ?t2)
      (available_p3 ?t1)
      (available_p3 ?t2)
      (not (meeting-scheduled-p3))
    )
    :effect (and
      (meeting-scheduled-p3)
      (meeting_start_p3 ?t1)
    )
  )

  ;; Orchestrator / integrator action: only succeeds if the three participants are all available
  ;; on two consecutive 30-min slots that map to the same real-world pair of times.
  (:action schedule_meeting_all_participants
    :parameters
      (?m_start - slot ?m_next - slot            ; Michelle's slot names
       ?s_start - slot ?s_next - slot            ; Steven's slot names
       ?p3_start - slot ?p3_next - slot)         ; Participant-3's slot names
    :precondition (and
      ;; adjacency inside each participant's namespace
      (next ?m_start ?m_next)
      (next ?s_start ?s_next)
      (next ?p3_start ?p3_next)

      ;; the three participants' start slots must represent the same real time
      (same-slot ?m_start ?s_start)
      (same-slot ?m_start ?p3_start)
      ;; and their next slots must represent the same real time (i.e., the consecutive slot)
      (same-slot ?m_next ?s_next)
      (same-slot ?m_next ?p3_next)

      ;; per-participant availability for both consecutive slots
      (available_p1 michelle ?m_start)
      (available_p1 michelle ?m_next)

      (free_steven ?s_start)
      (free_steven ?s_next)

      (available_p3 ?p3_start)
      (available_p3 ?p3_next)

      ;; global guard: not already scheduled
      (not (meeting_scheduled_global))
    )
    :effect (and
      (meeting_scheduled_global)
      (meeting_start_at ?m_start)
    )
  )
)