(define (domain sf-meet-classical)
  (:requirements :typing :strips :fluents :action-costs)
  (:types agent location time)
  (:predicates
    (current-time ?t - time)
    (at-visitor ?l - location)
    (jessica-at ?l - location)
    (after15 ?t1 ?t2 - time)
    (jessica-available-interval ?t1 ?t2 - time)
    (met)
  )
  (:functions (total-cost))

  (:action travel-visitor
    :parameters (?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and
      (current-time ?t1)
      (at-visitor ?from)
      (after15 ?t1 ?t2)
    )
    :effect (and
      (not (at-visitor ?from))
      (at-visitor ?to)
      (not (current-time ?t1))
      (current-time ?t2)
      (increase (total-cost) 0)
    )
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and
      (current-time ?t1)
      (after15 ?t1 ?t2)
    )
    :effect (and
      (not (current-time ?t1))
      (current-time ?t2)
      (increase (total-cost) 0)
    )
  )

  (:action meet-visitor-jessica
    :parameters (?loc - location ?tstart - time ?tend - time)
    :precondition (and
      (current-time ?tstart)
      (at-visitor ?loc)
      (jessica-at ?loc)
      (jessica-available-interval ?tstart ?tend)
    )
    :effect (and
      (met)
      (not (current-time ?tstart))
      (current-time ?tend)
      (increase (total-cost) 0)
    )
  )
)