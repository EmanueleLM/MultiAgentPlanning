(define (domain meeting-schedule-classical)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent person location time)

  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?p - person)
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
    :parameters (?a - agent ?from - location ?to - location ?t - time ?t2 - time)
    :precondition (and (at ?a ?from) (at-time ?t) (adv7 ?t ?t2))
    :effect (and (not (at ?a ?from)) (at ?a ?to) (not (at-time ?t)) (at-time ?t2))
  )

  (:action meet-joshua-by-traveler
    :parameters (?a - agent ?p - person ?loc - location ?t - time ?t2 - time)
    :precondition (and (at ?a ?loc) (person-location ?p ?loc) (at-time ?t) (adv75 ?t ?t2) (start-ok ?t) (not (met ?a ?p)))
    :effect (and (met ?a ?p) (not (at-time ?t)) (at-time ?t2))
  )
)