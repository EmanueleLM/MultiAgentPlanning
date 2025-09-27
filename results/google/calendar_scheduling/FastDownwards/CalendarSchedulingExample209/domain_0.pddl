(define (domain meeting-scheduling)
  (:requirements :strips :typing)
  (:types timepoint)
  (:predicates
    (timepoint ?t - timepoint)
    (available-michael ?t - timepoint)
    (available-samuel ?t - timepoint)
    (available-aaron ?t - timepoint)
    (available-judith ?t - timepoint)
    (available-kevin ?t - timepoint)
    (scheduled ?t - timepoint)
  )

  ;; Single scheduling action: can schedule at any timepoint that is available for all agents.
  (:action schedule
    :parameters (?t - timepoint)
    :precondition (and
      (timepoint ?t)
      (available-michael ?t)
      (available-samuel ?t)
      (available-aaron ?t)
      (available-judith ?t)
      (available-kevin ?t)
    )
    :effect (and
      (scheduled ?t)
    )
  )
)