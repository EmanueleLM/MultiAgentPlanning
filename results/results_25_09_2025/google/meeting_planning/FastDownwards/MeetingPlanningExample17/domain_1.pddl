(define (domain orchestrator-classical)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types agent location time)
  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (matthew-present-range ?t - time ?t2 - time)
    (succ15 ?t - time ?t2 - time)
    (succ16 ?t - time ?t2 - time)
    (succ17 ?t - time ?t2 - time)
    (met-matthew)
  )
  (:functions (total-cost))

  (:action travel-als-to-sunset
    :parameters (?t - time ?t2 - time)
    :precondition (and (at traveler AlamoSquare ?t) (succ16 ?t ?t2))
    :effect (and (not (at traveler AlamoSquare ?t)) (at traveler SunsetDistrict ?t2) (increase (total-cost) 16))
  )

  (:action travel-sunset-to-als
    :parameters (?t - time ?t2 - time)
    :precondition (and (at traveler SunsetDistrict ?t) (succ17 ?t ?t2))
    :effect (and (not (at traveler SunsetDistrict ?t)) (at traveler AlamoSquare ?t2) (increase (total-cost) 17))
  )

  (:action meet-matthew
    :parameters (?t - time ?t2 - time)
    :precondition (and (at traveler SunsetDistrict ?t) (succ15 ?t ?t2) (matthew-present-range ?t ?t2))
    :effect (and (not (at traveler SunsetDistrict ?t)) (at traveler SunsetDistrict ?t2) (met-matthew) (increase (total-cost) -100))
  )
)