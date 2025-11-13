(define (domain meeting_planning_example17)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types location time)
  (:constants
    alamo_square sunset_district - location
  )
  (:predicates
    (at ?l - location)
    (time-at ?t - time)
    (succ1 ?from - time ?to - time)
    (succ15 ?from - time ?to - time)
    (succ16 ?from - time ?to - time)
    (succ17 ?from - time ?to - time)
    (matthew-available ?t - time)
    (met_matthew)
  )
  (:functions
    (total-cost)
  )

  (:action wait1
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (time-at ?t1)
      (succ1 ?t1 ?t2)
    )
    :effect (and
      (not (time-at ?t1))
      (time-at ?t2)
      (increase (total-cost) 1)
    )
  )

  (:action move_as_to_sd
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at alamo_square)
      (time-at ?t1)
      (succ16 ?t1 ?t2)
    )
    :effect (and
      (not (at alamo_square))
      (at sunset_district)
      (not (time-at ?t1))
      (time-at ?t2)
      (increase (total-cost) 16)
    )
  )

  (:action move_sd_to_as
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at sunset_district)
      (time-at ?t1)
      (succ17 ?t1 ?t2)
    )
    :effect (and
      (not (at sunset_district))
      (at alamo_square)
      (not (time-at ?t1))
      (time-at ?t2)
      (increase (total-cost) 17)
    )
  )

  (:action meet_matthew
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (at sunset_district)
      (time-at ?t1)
      (matthew-available ?t1)
      (succ15 ?t1 ?t2)
      (not (met_matthew))
    )
    :effect (and
      (met_matthew)
      (not (time-at ?t1))
      (time-at ?t2)
      (increase (total-cost) 15)
    )
  )
)