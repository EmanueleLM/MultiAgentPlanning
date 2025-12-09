(define (domain transport_combined)
  :requirements :strips :typing :negative-preconditions
  :types
    object
    package - object
    vehicle - object
    truck - vehicle
    airplane - vehicle
    location - object
    city - object
  :predicates
    (at ?o - object ?l - location)
    (in ?p - package ?v - vehicle)
    (free ?p - package)
    (in-city ?l - location ?c - city)
    (airport ?l - location)

  ;; Truck actions (prefixed with 'truck-')
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (at ?t ?l) (at ?p ?l) (free ?p))
    :effect (and (in ?p ?t) (not (at ?p ?l)) (not (free ?p)))
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (at ?t ?l) (in ?p ?t))
    :effect (and (not (in ?p ?t)) (at ?p ?l) (free ?p))
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  ;; Airplane actions (prefixed with 'plane-')
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (at ?a ?l) (at ?p ?l) (free ?p))
    :effect (and (in ?p ?a) (not (at ?p ?l)) (not (free ?p)))
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (at ?a ?l) (in ?p ?a))
    :effect (and (not (in ?p ?a)) (at ?p ?l) (free ?p))
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)