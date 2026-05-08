(define (domain schedule-meeting)
  (:requirements :strips :typing :negative-preconditions)
  (:types person slot meeting)

  (:predicates
    (person ?p - person)
    (slot ?s - slot)
    (meeting ?m - meeting)
    (available ?p - person ?s - slot)           ; participant is available for a 60-min meeting starting at slot
    (unscheduled ?m - meeting)                  ; meeting not yet scheduled
    (scheduled ?m - meeting ?s - slot)          ; meeting scheduled at slot
    (meeting-scheduled ?m - meeting)            ; meeting has been scheduled
    (next ?s1 - slot ?s2 - slot)                ; successor relation among start slots (30-min granularity)
  )

  ; Single atomic action schedules the meeting at a slot that is marked available for every required participant.
  (:action schedule
    :parameters (?m - meeting ?s - slot)
    :precondition (and
                    (unscheduled ?m)
                    (meeting ?m)
                    (slot ?s)
                    (available david ?s)
                    (available debra ?s)
                    (available kevin ?s)
                   )
    :effect (and
              (not (unscheduled ?m))
              (scheduled ?m ?s)
              (meeting-scheduled ?m)
            )
  )
)