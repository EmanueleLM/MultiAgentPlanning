(define (domain meeting-schedule-classical)
  (:requirements :strips :typing :negative-preconditions :equality :fluents :action-costs)
  (:types agent person location time)

  (:predicates
    (at ?l - location)
    (met ?p - person)
    (at-time ?t - time)
    (adv7 ?t1 ?t2 - time)
    (adv75 ?t1 ?t2 - time)
    (adv1 ?t1 ?t2 - time)
    (start-ok ?t - time)
    (person-location ?p - person ?l - location)
  )

  (:functions (total-cost))

  (:action travel
    :parameters (?from ?to - location ?t ?t2 - time)
    :precondition (and (at ?from) (at-time ?t) (adv7 ?t ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (at-time ?t)) (at-time ?t2) (increase (total-cost) 0))
  )

  (:action meet-person
    :parameters (?p - person ?loc - location ?t ?t2 - time)
    :precondition (and (at ?loc) (person-location ?p ?loc) (at-time ?t) (adv75 ?t ?t2) (start-ok ?t) (not (met ?p)))
    :effect (and (met ?p) (not (at-time ?t)) (at-time ?t2) (increase (total-cost) -1))
  )

  (:action wait-1min
    :parameters (?t ?t2 - time)
    :precondition (and (at-time ?t) (adv1 ?t ?t2))
    :effect (and (not (at-time ?t)) (at-time ?t2) (increase (total-cost) 0))
  )
)