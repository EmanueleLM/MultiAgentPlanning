(define (domain meeting-domain)
  (:requirements :strips :typing :adl :negative-preconditions :action-costs)
  (:types location time)
  (:predicates
    (visitor-at ?l - location)
    (stephanie-at ?l - location)
    (at-time ?t - time)
    (met-stephanie)
    (time-jump-1 ?t1 ?t2 - time)
    (time-jump-17 ?t1 ?t2 - time)
    (time-jump-18 ?t1 ?t2 - time)
    (time-jump-120 ?t1 ?t2 - time)
    (meet-window ?t1 ?t2 - time)
  )
  (:action travel-rd-to-nb
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (visitor-at richmond-district)
      (at-time ?t1)
      (time-jump-17 ?t1 ?t2)
    )
    :effect (and
      (not (visitor-at richmond-district))
      (visitor-at north-beach)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 17
  )
  (:action travel-nb-to-rd
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (visitor-at north-beach)
      (at-time ?t1)
      (time-jump-18 ?t1 ?t2)
    )
    :effect (and
      (not (visitor-at north-beach))
      (visitor-at richmond-district)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 18
  )
  (:action wait-1min
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (at-time ?t1)
      (time-jump-1 ?t1 ?t2)
    )
    :effect (and
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 1
  )
  (:action meet-stephanie
    :parameters (?t1 ?t2 - time)
    :precondition (and
      (visitor-at north-beach)
      (stephanie-at north-beach)
      (at-time ?t1)
      (time-jump-120 ?t1 ?t2)
      (meet-window ?t1 ?t2)
      (not (met-stephanie))
    )
    :effect (and
      (met-stephanie)
      (not (at-time ?t1))
      (at-time ?t2)
    )
    :cost 120
  )
)