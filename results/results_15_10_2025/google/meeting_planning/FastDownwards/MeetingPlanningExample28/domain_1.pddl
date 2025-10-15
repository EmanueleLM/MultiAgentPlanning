(define (domain meeting-schedule-classical)
  (:requirements :strips :typing :negative-preconditions :equality :action-costs)
  (:types agent person location time)

  (:predicates
    (at ?l - location)
    (met ?p - person)
    (at-time ?t - time)
    (adv7 ?t1 ?t2 - time)
    (adv75 ?t1 ?t2 - time)
    (adv1 ?t1 ?t2 - time)
    (start-ok ?t - time)
  )

  (:action travel-us-cn
    :parameters (?t ?t2 - time)
    :precondition (and (at union-square) (at-time ?t) (adv7 ?t ?t2))
    :effect (and (not (at union-square)) (at chinatown) (not (at-time ?t)) (at-time ?t2))
    :cost 0
  )

  (:action travel-cn-us
    :parameters (?t ?t2 - time)
    :precondition (and (at chinatown) (at-time ?t) (adv7 ?t ?t2))
    :effect (and (not (at chinatown)) (at union-square) (not (at-time ?t)) (at-time ?t2))
    :cost 0
  )

  (:action meet-joshua
    :parameters (?t ?t2 - time)
    :precondition (and (at chinatown) (at-time ?t) (adv75 ?t ?t2) (start-ok ?t) (not (met joshua)))
    :effect (and (met joshua) (not (at-time ?t)) (at-time ?t2))
    :cost -1
  )

  (:action wait-1min
    :parameters (?t ?t2 - time)
    :precondition (and (at-time ?t) (adv1 ?t ?t2))
    :effect (and (not (at-time ?t)) (at-time ?t2))
    :cost 0
  )
)