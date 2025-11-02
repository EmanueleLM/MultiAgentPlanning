(define (domain calendar-scheduling-example4)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent window)
  (:predicates
    (free ?a - agent ?w - window)
    (within_work_hours ?w - window)
    (all_free ?w - window)
    (chosen ?w - window)
    (scheduled)
  )
  (:action schedule
    :parameters (?w - window)
    :precondition (and
      (within_work_hours ?w)
      (all_free ?w)
      (not (scheduled))
    )
    :effect (and
      (scheduled)
      (chosen ?w)
    )
  )
)