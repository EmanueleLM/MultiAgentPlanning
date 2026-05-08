; Domain: meeting-scheduling
; Intended for FastDownwards. Requires only :strips, :typing, :negative-preconditions.
(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types participant slot)

  (:predicates
    (next ?s - slot ?s2 - slot)                ; immediate successor 30-min slot
    (available ?p - participant ?s - slot)    ; participant p is available starting at slot s (covers s..s+30min)
    (confirmed ?p - participant ?s - slot)    ; participant p has confirmed a meeting starting at slot s
    (meeting-scheduled)                        ; global flag: meeting has been scheduled
    (scheduled-at ?s - slot)                   ; meeting scheduled at start slot s
  )

  ; Participant-specific confirmation actions (distinct per agent)
  (:action confirm-participant-a
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (available participant-a ?s)
      (available participant-a ?s2)
      (not (confirmed participant-a ?s))
      (not (meeting-scheduled))
    )
    :effect (and (confirmed participant-a ?s))
  )

  (:action confirm-participant-b
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (available participant-b ?s)
      (available participant-b ?s2)
      (not (confirmed participant-b ?s))
      (not (meeting-scheduled))
    )
    :effect (and (confirmed participant-b ?s))
  )

  (:action confirm-participant-c
    :parameters (?s - slot ?s2 - slot)
    :precondition (and
      (next ?s ?s2)
      (available participant-c ?s)
      (available participant-c ?s2)
      (not (confirmed participant-c ?s))
      (not (meeting-scheduled))
    )
    :effect (and (confirmed participant-c ?s))
  )

  ; Orchestrator finalizes once all participants have confirmed the same start slot
  (:action orchestrator-finalize
    :parameters (?s - slot)
    :precondition (and
      (confirmed participant-a ?s)
      (confirmed participant-b ?s)
      (confirmed participant-c ?s)
      (not (meeting-scheduled))
    )
    :effect (and
      (meeting-scheduled)
      (scheduled-at ?s)
    )
  )
)