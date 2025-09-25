(define (domain integrated-meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot)

  (:predicates
    ;; time slots and work-slot marker
    (slot ?s - slot)
    (work-slot ?s - slot)

    ;; participant/person marker (some agent fragments used (participant ...))
    (participant ?p - person)

    ;; availability predicates used by different agent fragments
    (free ?p - person ?s - slot)        ; used by Alan, Michael, Michelle, Natalie
    (available ?p - person ?s - slot)   ; used by Roy, Judy, Brian

    ;; global meeting flag and scheduling facts (canonical)
    (meeting-scheduled)                 ; canonical boolean indicating a meeting has been scheduled
    (scheduled-at ?s - slot)            ; canonical unary slot where meeting is scheduled
    (meeting-at ?s - slot)              ; alternative name used by Natalie (kept for compatibility)

    ;; aggregate feasibility predicates used by some fragments
    (slot-feasible-for-all ?s - slot)   ; used by Michael
    (all-free ?s - slot)                ; used by Natalie

    ;; extra attendance bookkeeping used by Roy
    (attends ?p - person ?s - slot)
    (attended ?p - person)
  )

  ;; Actions: keep each agent's scheduling action distinct (names indicate the agent).
  ;; All actions respect the canonical "meeting-scheduled" flag (no meeting may be scheduled twice).
  ;; When an action schedules a meeting it sets the canonical (meeting-scheduled) and records the slot
  ;; using (scheduled-at ?s). Some actions also set agent-specific attendance facts for compatibility.

  (:action alan-schedule
    :parameters (?s - slot ?p - person)
    :precondition (and
                    (slot ?s)
                    (participant ?p)
                    (free ?p ?s)
                    (not (meeting-scheduled))
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )

  (:action michael-schedule-meeting
    :parameters (?s - slot ?p - person)
    :precondition (and
                    (not (meeting-scheduled))
                    (free ?p ?s)
                    (slot-feasible-for-all ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )

  (:action michelle-schedule
    :parameters (?p - person ?s - slot)
    :precondition (and
                    (free ?p ?s)
                    (not (meeting-scheduled))
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
              (not (free ?p ?s))
            )
  )

  (:action roy-schedule
    :parameters (?p - person ?s - slot)
    :precondition (and
                    (not (meeting-scheduled))
                    (available ?p ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
              (attends ?p ?s)
              (attended ?p)
            )
  )

  (:action judy-schedule
    :parameters (?p - person ?s - slot)
    :precondition (and
                    (work-slot ?s)
                    (available ?p ?s)
                    (not (meeting-scheduled))
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )

  (:action natalie-schedule-meeting
    :parameters (?s - slot)
    :precondition (and
                    (not (meeting-scheduled))
                    (all-free ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (meeting-at ?s)
              (scheduled-at ?s)
            )
  )

  (:action brian-schedule-meeting
    :parameters (?p - person ?s - slot)
    :precondition (and
                    (participant ?p)
                    (slot ?s)
                    (available ?p ?s)
                    (not (meeting-scheduled))
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )
)