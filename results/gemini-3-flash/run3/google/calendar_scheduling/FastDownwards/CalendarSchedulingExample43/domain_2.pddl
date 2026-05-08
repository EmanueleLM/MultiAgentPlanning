(define (domain calendar_scheduling)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types person time)
  (:constants albert gregory benjamin - person)
  (:predicates
    (is_busy ?p - person ?t - time)
    (scheduled)
    (at_time ?t - time)
  )
  (:functions
    (total-cost)
    (time_cost ?t - time)
  )
  (:action schedule
    :parameters (?t - time)
    :precondition (and
      (not (scheduled))
      (not (is_busy albert ?t))
      (not (is_busy gregory ?t))
      (not (is_busy benjamin ?t))
    )
    :effect (and
      (scheduled)
      (at_time ?t)
      (increase (total-cost) (time_cost ?t))
    )
  )
)