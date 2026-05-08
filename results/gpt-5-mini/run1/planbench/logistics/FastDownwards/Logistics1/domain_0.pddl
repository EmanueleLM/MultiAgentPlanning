(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; package/location/vehicle predicates
    (at ?p - package ?l - location)               ;; package at a location
    (in-truck ?p - package ?t - truck)           ;; package inside a truck
    (in-airplane ?p - package ?a - airplane)     ;; package inside an airplane

    (truck-at ?t - truck ?l - location)          ;; truck is at location
    (airplane-at ?a - airplane ?l - location)    ;; airplane is at location

    ;; static geography predicates
    (located-in-city ?l - location ?c - city)    ;; location belongs to a city
    (is-airport ?l - location)                   ;; location is an airport
    (road ?from - location ?to - location)       ;; road connectivity (directed)
    (flight-route ?from - location ?to - location) ;; flight route between airports (directed)
  )

  ;; Truck agent actions (names prefixed with "truck-")
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (at ?p ?l)
      ;; prevent loading if already registered inside same truck (redundant safe-check)
      (not (in-truck ?p ?t))
    )
    :effect (and
      (not (at ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (truck-at ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at ?p ?l)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (truck-at ?t ?from)
      (road ?from ?to)
    )
    :effect (and
      (not (truck-at ?t ?from))
      (truck-at ?t ?to)
    )
  )

  ;; Airplane agent actions (names prefixed with "airplane-")
  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (is-airport ?l)
      (at ?p ?l)
      ;; prevent loading if already in same airplane (redundant safe-check)
      (not (in-airplane ?p ?a))
    )
    :effect (and
      (not (at ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (airplane-at ?a ?l)
      (is-airport ?l)
      (in-airplane ?p ?a)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at ?p ?l)
    )
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane-at ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
      (flight-route ?from ?to)
    )
    :effect (and
      (not (airplane-at ?a ?from))
      (airplane-at ?a ?to)
    )
  )
)