(define (domain calendar_scheduling_example27)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    slot
  )

  (:constants
    jesse kathryn megan - participant
  )

  (:predicates
    (free ?p - participant ?s - slot)
    (earlier ?s1 - slot ?s2 - slot)
    (chosen ?s - slot)
    (meeting_scheduled)
  )

  (:action schedule_at_earliest_slot
    :parameters (?s - slot)
    :precondition
      (and
        (not (meeting_scheduled))
        (free jesse ?s)
        (free kathryn ?s)
        (free megan ?s)
        (not (chosen ?s))
      )
    :effect
      (and
        (chosen ?s)
        (meeting_scheduled))
  )
)