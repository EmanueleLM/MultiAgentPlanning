(define (domain schedule-orchestration)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location)
    (at-time ?t - time)
    (next16 ?t1 - time ?t2 - time)
    (next18 ?t1 - time ?t2 - time)
    (next15 ?t1 - time ?t2 - time)
    (met-james)
  )

  (:action travel-ggp-to-marina
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at-time ?t1) (at traveler golden-gate-park) (next16 ?t1 ?t2))
    :effect (and
      (not (at traveler golden-gate-park))
      (at traveler marina)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 16
  )

  (:action travel-marina-to-ggp
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at-time ?t1) (at traveler marina) (next18 ?t1 ?t2))
    :effect (and
      (not (at traveler marina))
      (at traveler golden-gate-park)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 18
  )

  (:action meet-james-15
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (at-time ?t1) (at traveler marina) (next15 ?t1 ?t2))
    :effect (and
      (met-james)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost -10000
  )
)