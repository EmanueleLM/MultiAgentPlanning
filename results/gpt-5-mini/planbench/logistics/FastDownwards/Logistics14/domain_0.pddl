(define (domain logistics-multiagent)
  (:requirements :strips :typing)
  (:types truck airplane package location)

  (:predicates
    (at ?obj - (either truck airplane package) ?loc - location)
    (in ?p - package ?v - (either truck airplane))
    (road-connected ?l1 - location ?l2 - location)
    (air-connected ?l1 - location ?l2 - location)
  )

  ;; Truck agent actions (prefixed with "truck-")
  (:action truck-load
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (at ?p ?loc) (at ?t ?loc))
    :effect (and (not (at ?p ?loc)) (in ?p ?t))
  )

  (:action truck-unload
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in ?p ?t) (at ?t ?loc))
    :effect (and (not (in ?p ?t)) (at ?p ?loc))
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (at ?t ?from) (road-connected ?from ?to))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  ;; Airplane agent actions (prefixed with "airplane-")
  (:action airplane-load
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (at ?p ?loc) (at ?a ?loc))
    :effect (and (not (at ?p ?loc)) (in ?p ?a))
  )

  (:action airplane-unload
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (in ?p ?a) (at ?a ?loc))
    :effect (and (not (in ?p ?a)) (at ?p ?loc))
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (air-connected ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)