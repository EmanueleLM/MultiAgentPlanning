(define (domain multi-agent-scheduling-classical)
  (:requirements :strips :typing :negative-preconditions :action-costs :adl)
  (:types agent person location time)

  (:predicates
    (at-agent ?a - agent ?l - location)
    (current-time ?t - time)
    (met ?p - person)
    (can-travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (can-wait ?t1 - time ?t2 - time)
    (can-meet ?p - person ?loc - location ?t1 - time ?t2 - time)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at-agent ?a ?from) (current-time ?t1) (can-travel ?from ?to ?t1 ?t2))
    :effect (and (not (at-agent ?a ?from)) (at-agent ?a ?to) (not (current-time ?t1)) (current-time ?t2))
    :cost 0
  )

  (:action wait
    :parameters (?t1 - time ?t2 - time)
    :precondition (and (current-time ?t1) (can-wait ?t1 ?t2))
    :effect (and (not (current-time ?t1)) (current-time ?t2))
    :cost 0
  )

  (:action meet
    :parameters (?a - agent ?p - person ?loc - location ?t1 - time ?t2 - time)
    :precondition (and (at-agent ?a ?loc) (current-time ?t1) (can-meet ?p ?loc ?t1 ?t2))
    :effect (and (met ?p) (not (current-time ?t1)) (current-time ?t2))
    :cost -1
  )
)