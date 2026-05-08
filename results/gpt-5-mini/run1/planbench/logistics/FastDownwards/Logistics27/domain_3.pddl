(define (domain logistics27)
  (:requirements :strips :typing)
  (:types
    truck
    airplane
    package
    location
    city
  )

  (:predicates
    ;; package state
    (at ?p - package ?l - location)         ;; package is at a location
    (in ?p - package ?v - (either truck airplane)) ;; package is in a vehicle (truck or airplane)

    ;; vehicle locations (separate predicates for clarity/invariants)
    (truck-at ?t - truck ?l - location)
    (plane-at ?a - airplane ?l - location)

    ;; location properties
    (airport ?l - location)                 ;; location is an airport
    (in-city ?l - location ?c - city)       ;; location belongs to a city
  )

  ;; -------------------------
  ;; Truck actions (intra-city)
  ;; -------------------------
  (:action truck-load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (in ?p ?t)
      (not (at ?p ?loc))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (in ?p ?t)
    )
    :effect (and
      (at ?p ?loc)
      (not (in ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;; -------------------------
  ;; Airplane actions (inter-city via airports)
  ;; -------------------------
  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (plane-at ?a ?loc)
      (airport ?loc)
      (at ?p ?loc)
    )
    :effect (and
      (in ?p ?a)
      (not (at ?p ?loc))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (plane-at ?a ?loc)
      (airport ?loc)
      (in ?p ?a)
    )
    :effect (and
      (at ?p ?loc)
      (not (in ?p ?a))
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (plane-at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (plane-at ?a ?to)
      (not (plane-at ?a ?from))
    )
  )
)