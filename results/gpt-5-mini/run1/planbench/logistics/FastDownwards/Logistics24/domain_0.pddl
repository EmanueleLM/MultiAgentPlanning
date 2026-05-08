(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle - thing
    truck airplane - vehicle
    package - thing
    thing
    location
    city
  )

  (:predicates
    ;; Generic location of any physical thing (trucks, airplanes, packages)
    (at ?x - thing ?l - location)
    ;; A package is loaded in a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)
    ;; A location belongs to a city
    (loc-in-city ?l - location ?c - city)
    ;; A location is an airport
    (airport ?l - location)
  )

  ;; Truck actions (operate only within a single city)
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc-in-city ?from ?c)
      (loc-in-city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action load-into-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (at ?p ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  (:action unload-from-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Airplane actions (only between airports)
  (:action fly-plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action load-onto-plane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (at ?p ?l)
      (airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  (:action unload-from-plane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (in ?p ?a)
      (airport ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )
)