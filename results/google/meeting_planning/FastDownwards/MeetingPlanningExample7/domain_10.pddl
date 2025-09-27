(define (domain meeting-scheduling)
  (:requirements :strips :typing :negative-preconditions :equality :adl :action-costs)
  (:types agent location time)
  (:constants traveler john orchestrator - agent richmond_district north_beach - location)
  (:predicates
    (at ?a - agent ?l - location ?t - time)
    (succ ?t1 - time ?t2 - time)
    (can-travel ?from - location ?to - location ?t1 - time ?t2 - time)
    (allowed-meet ?s - time ?e - time)
    (met-john)
  )
  (:action wait
    :parameters (?p - agent ?loc - location ?t - time ?t2 - time)
    :precondition (and (at ?p ?loc ?t) (succ ?t ?t2) (= ?p traveler))
    :effect (and (not (at ?p ?loc ?t)) (at ?p ?loc ?t2))
    :cost 0
  )
  (:action travel-rd-nb
    :parameters (?p - agent ?t - time ?t2 - time)
    :precondition (and (at ?p richmond_district ?t) (can-travel richmond_district north_beach ?t ?t2) (= ?p traveler))
    :effect (and (not (at ?p richmond_district ?t)) (at ?p north_beach ?t2))
    :cost 17
  )
  (:action travel-nb-rd
    :parameters (?p - agent ?t - time ?t2 - time)
    :precondition (and (at ?p north_beach ?t) (can-travel north_beach richmond_district ?t ?t2) (= ?p traveler))
    :effect (and (not (at ?p north_beach ?t)) (at ?p richmond_district ?t2))
    :cost 18
  )
  (:action meet-john
    :parameters (?p - agent ?s - time ?e - time)
    :precondition (and (= ?p traveler) (at ?p north_beach ?s) (allowed-meet ?s ?e) (not (met-john)))
    :effect (and (not (at ?p north_beach ?s)) (at ?p north_beach ?e) (met-john))
    :cost -75
  )
)