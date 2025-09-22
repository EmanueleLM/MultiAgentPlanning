(define (domain orchestrated-travelers-symbolic)
  (:requirements :typing :negative-preconditions :fluents :action-costs)
  (:types agent location time)

  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (met ?a - agent ?b - agent)
    (plus1 ?t1 - time ?t2 - time)
    (plus16 ?t1 - time ?t2 - time)
    (plus17 ?t1 - time ?t2 - time)
    (within-avail ?t - time)
  )

  (:functions (total-cost))

  (:action wait
    :parameters (?ag - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (at ?ag ?loc ?t) (plus1 ?t ?t2))
    :effect (and (at ?ag ?loc ?t2) (increase (total-cost) 0))
  )

  (:action travel-alamo-to-sunset
    :parameters (?ag - agent ?t - time ?t2 - time)
    :precondition (and (at ?ag AlamoSquare ?t) (plus16 ?t ?t2))
    :effect (and (at ?ag SunsetDistrict ?t2) (increase (total-cost) 0))
  )

  (:action travel-sunset-to-alamo
    :parameters (?ag - agent ?t - time ?t2 - time)
    :precondition (and (at ?ag SunsetDistrict ?t) (plus17 ?t ?t2))
    :effect (and (at ?ag AlamoSquare ?t2) (increase (total-cost) 0))
  )

  (:action meet-at-sunset
    :parameters (?t0 - time ?t1 - time ?t2 - time ?t3 - time ?t4 - time ?t5 - time ?t6 - time ?t7 - time ?t8 - time ?t9 - time ?t10 - time ?t11 - time ?t12 - time ?t13 - time ?t14 - time)
    :precondition (and
      (plus1 ?t0 ?t1) (plus1 ?t1 ?t2) (plus1 ?t2 ?t3) (plus1 ?t3 ?t4) (plus1 ?t4 ?t5)
      (plus1 ?t5 ?t6) (plus1 ?t6 ?t7) (plus1 ?t7 ?t8) (plus1 ?t8 ?t9) (plus1 ?t9 ?t10)
      (plus1 ?t10 ?t11) (plus1 ?t11 ?t12) (plus1 ?t12 ?t13) (plus1 ?t13 ?t14)

      (at traveler SunsetDistrict ?t0) (at traveler SunsetDistrict ?t1) (at traveler SunsetDistrict ?t2) (at traveler SunsetDistrict ?t3) (at traveler SunsetDistrict ?t4)
      (at traveler SunsetDistrict ?t5) (at traveler SunsetDistrict ?t6) (at traveler SunsetDistrict ?t7) (at traveler SunsetDistrict ?t8) (at traveler SunsetDistrict ?t9)
      (at traveler SunsetDistrict ?t10) (at traveler SunsetDistrict ?t11) (at traveler SunsetDistrict ?t12) (at traveler SunsetDistrict ?t13) (at traveler SunsetDistrict ?t14)

      (at matthew SunsetDistrict ?t0) (at matthew SunsetDistrict ?t1) (at matthew SunsetDistrict ?t2) (at matthew SunsetDistrict ?t3) (at matthew SunsetDistrict ?t4)
      (at matthew SunsetDistrict ?t5) (at matthew SunsetDistrict ?t6) (at matthew SunsetDistrict ?t7) (at matthew SunsetDistrict ?t8) (at matthew SunsetDistrict ?t9)
      (at matthew SunsetDistrict ?t10) (at matthew SunsetDistrict ?t11) (at matthew SunsetDistrict ?t12) (at matthew SunsetDistrict ?t13) (at matthew SunsetDistrict ?t14)

      (within-avail ?t0)

      (not (met matthew traveler))
    )
    :effect (and
      (met matthew traveler)
      (increase (total-cost) 1)
    )
  )

)