(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle
    truck airplane - vehicle
    package
    location
    city
  )

  (:predicates
    ;; object locations
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)

    ;; containment: a package is in a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)

    ;; location-to-city relation and special airport marker
    (in-city ?l - location ?c - city)
    (airport ?l - location)

    ;; connectivity
    (road ?from - location ?to - location)
    (air-route ?from - location ?to - location)
  )

  ;; TRUCK actions
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-package ?p ?l)
    )
    :effect (and
      (in ?p ?t)
      (not (at-package ?p ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in ?p ?t))
    )
  )

  ;; Drive only between locations that are in the same city.
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (road ?from ?to)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; AIRPLANE actions
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-plane ?a ?l)
      (at-package ?p ?l)
    )
    :effect (and
      (in ?p ?a)
      (not (at-package ?p ?l))
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-plane ?a ?l)
      (in ?p ?a)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in ?p ?a))
    )
  )

  ;; Fly only along declared air routes between airport locations.
  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?a ?from)
      (air-route ?from ?to)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at-plane ?a ?to)
      (not (at-plane ?a ?from))
    )
  )
)