(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions)
  (:types slot person)

  (:predicates
    (slot ?s - slot)
    (next ?s1 - slot ?s2 - slot)
    (free ?p - person ?s - slot)
    (before-1500 ?s - slot)
    (meeting-scheduled)
    (scheduled-at ?s - slot)
  )

  ;; Schedule a single 30-minute meeting at a specific slot for a specific participant.
  ;; Preconditions:
  ;;  - slot exists
  ;;  - meeting not already scheduled
  ;;  - specified participant is free at that slot
  ;;  - slot satisfies Billy's hard preference (before 15:00)
  ;; Effects:
  ;;  - meeting is scheduled and the start slot is recorded
  (:action schedule-meeting
    :parameters (?s - slot ?p - person)
    :precondition (and
                    (slot ?s)
                    (not (meeting-scheduled))
                    (free ?p ?s)
                    (before-1500 ?s)
                  )
    :effect (and
              (meeting-scheduled)
              (scheduled-at ?s)
            )
  )
)