(define (domain logistics_combined)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    city
    location
    truck
    airplane
    package
  )

  (:predicates
    ; vehicle locations
    (at-truck ?t - truck ?l - location)
    (at-airplane ?ap - airplane ?l - location)

    ; package at a location (not inside a vehicle)
    (at-p ?p - package ?l - location)

    ; package containment (distinct predicates for truck vs airplane to avoid implicit mixing)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?ap - airplane)

    ; package availability flag: true iff package is not in any vehicle and therefore located at some location
    (free ?p - package)

    ; static membership and airport flags
    (in_city ?l - location ?c - city)
    (airport ?l - location)

    ; explicit cross-city relation (used to require flights between different cities)
    (diff-city ?c1 - city ?c2 - city)
  )

  ;; Truck actions (namespaced "truck-")

  (:action truck-load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (free ?p)
      (at-p ?p ?l)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (at-p ?p ?l))
      (not (free ?p))
      (in-truck ?p ?t)
    )
  )

  (:action truck-unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-p ?p ?l)
      (free ?p)
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Air actions (namespaced "air-")

  (:action air-load
    :parameters (?p - package ?ap - airplane ?a - location)
    :precondition (and
      (airport ?a)
      (free ?p)
      (at-p ?p ?a)
      (at-airplane ?ap ?a)
    )
    :effect (and
      (not (at-p ?p ?a))
      (not (free ?p))
      (in-airplane ?p ?ap)
    )
  )

  (:action air-unload
    :parameters (?p - package ?ap - airplane ?a - location)
    :precondition (and
      (airport ?a)
      (in-airplane ?p ?ap)
      (at-airplane ?ap ?a)
    )
    :effect (and
      (not (in-airplane ?p ?ap))
      (at-p ?p ?a)
      (free ?p)
    )
  )

  (:action air-fly
    :parameters (?ap - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (airport ?from)
      (airport ?to)
      (at-airplane ?ap ?from)
      (in_city ?from ?cfrom)
      (in_city ?to ?cto)
      (diff-city ?cfrom ?cto)
    )
    :effect (and
      (not (at-airplane ?ap ?from))
      (at-airplane ?ap ?to)
    )
  )
)