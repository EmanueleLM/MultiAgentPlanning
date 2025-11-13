(define (domain meetingplanningexample27-strips)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location timepoint)
  (:constants
    marina_district pacific_heights - location
  )
  (:predicates
    (at ?l - location)
    (idle)
    (met-margaret)
    (time ?t - timepoint)
    (succ6 ?t ?t2 - timepoint)
    (succ7 ?t ?t2 - timepoint)
    (succ15 ?t ?t2 - timepoint)
    (meet15_ok ?t ?t2 - timepoint)
  )
  (:functions
    (total-cost) - number
  )

  (:action move-marina-to-pacific
    :parameters (?t ?t7 - timepoint)
    :precondition (and (at marina_district) (idle) (time ?t) (succ7 ?t ?t7))
    :effect (and
      (not (at marina_district))
      (at pacific_heights)
      (not (time ?t))
      (time ?t7)
      (increase (total-cost) 7)
    )
  )

  (:action move-pacific-to-marina
    :parameters (?t ?t6 - timepoint)
    :precondition (and (at pacific_heights) (idle) (time ?t) (succ6 ?t ?t6))
    :effect (and
      (not (at pacific_heights))
      (at marina_district)
      (not (time ?t))
      (time ?t6)
      (increase (total-cost) 6)
    )
  )

  (:action wait-15min
    :parameters (?t ?t15 - timepoint)
    :precondition (and (idle) (time ?t) (succ15 ?t ?t15))
    :effect (and
      (not (time ?t))
      (time ?t15)
      (increase (total-cost) 15)
    )
  )

  (:action meet-margaret-15min
    :parameters (?t ?t15 - timepoint)
    :precondition (and
      (at pacific_heights)
      (idle)
      (not (met-margaret))
      (time ?t)
      (meet15_ok ?t ?t15)
    )
    :effect (and
      (met-margaret)
      (not (time ?t))
      (time ?t15)
      (increase (total-cost) 15)
    )
  )
)