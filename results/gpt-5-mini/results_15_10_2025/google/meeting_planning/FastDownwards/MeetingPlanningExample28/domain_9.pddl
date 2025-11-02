(define (domain meeting-schedule-classical)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent person location time)

  (:predicates
    (at ?l - location)
    (met ?p - person)
    (at-time ?t - time)
    (adv7 ?t1 - time ?t2 - time)
    (adv75 ?t1 - time ?t2 - time)
    (adv-gap ?t1 - time ?t2 - time)
    (start-ok ?t - time)
    (person-location ?p - person ?l - location)
  )

  (:action advance-time
    :parameters (?t - time ?t2 - time)
    :precondition (and (at-time ?t) (adv-gap ?t ?t2))
    :effect (and (not (at-time ?t)) (at-time ?t2))
  )

  (:action travel-traveler
    :parameters (?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and (at ?from) (at-time ?t) (adv7 ?t ?t2))
    :effect (and (not (at ?from)) (at ?to) (not (at-time ?t)) (at-time ?t2))
  )

  (:action meet-joshua-by-traveler
    :parameters (?p - person ?loc - location ?t - time ?t2 - time)
    :precondition (and (at ?loc) (person-location ?p ?loc) (at-time ?t) (adv75 ?t ?t2) (start-ok ?t) (not (met ?p)))
    :effect (and (met ?p) (not (at-time ?t)) (at-time ?t2))
  )
)