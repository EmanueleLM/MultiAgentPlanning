(define (domain traveler-meetings)
  (:requirements :strips :typing :negative-preconditions :equality)
  (:types agent person location timepoint)
  (:constants
    traveler - agent
    stephanie - person
    marina-district mission-district - location
  )
  (:predicates
    (at ?a - agent ?l - location)
    (available ?p - person ?l - location)
    (met ?a - agent ?p - person)
    (now ?t - timepoint)
    (offset20 ?t1 - timepoint ?t2 - timepoint)
    (offset19 ?t1 - timepoint ?t2 - timepoint)
    (offset10 ?t1 - timepoint ?t2 - timepoint)
    (offset120 ?t1 - timepoint ?t2 - timepoint)
    (meeting-start-allowed ?t - timepoint)
  )
  (:action travel-marina-to-mission
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (at traveler marina-district) (now ?from) (offset20 ?from ?to))
    :effect (and (not (now ?from)) (now ?to) (not (at traveler marina-district)) (at traveler mission-district))
  )
  (:action travel-mission-to-marina
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (at traveler mission-district) (now ?from) (offset19 ?from ?to))
    :effect (and (not (now ?from)) (now ?to) (not (at traveler mission-district)) (at traveler marina-district))
  )
  (:action wait-10
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (now ?from) (offset10 ?from ?to))
    :effect (and (not (now ?from)) (now ?to))
  )
  (:action meet-stephanie
    :parameters (?from - timepoint ?to - timepoint)
    :precondition (and (at traveler mission-district) (available stephanie mission-district) (not (met traveler stephanie)) (now ?from) (offset120 ?from ?to) (meeting-start-allowed ?from))
    :effect (and (met traveler stephanie) (not (now ?from)) (now ?to))
  )
)