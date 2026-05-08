(define (domain calendar_scheduling_example45)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    timeslot
  )

  (:predicates
    (available ?t - timeslot)
    (scheduled ?t - timeslot)
  )

  (:action schedule_at_1030
    :parameters ()
    :precondition (and
      (available t_1030)
      (not (scheduled t_1030))
    )
    :effect (scheduled t_1030)
  )
)