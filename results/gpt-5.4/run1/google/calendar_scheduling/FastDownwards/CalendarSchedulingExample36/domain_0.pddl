(define (domain meeting_schedule_monday_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    participant
    window
  )

  (:predicates
    (scheduled)
    (chosen ?w - window)
    (feasible ?w - window)
  )

  (:action schedule_in_window
    :parameters (?w - window)
    :precondition (and
      (not (scheduled))
      (feasible ?w)
    )
    :effect (and
      (scheduled)
      (chosen ?w)
    )
  )
)