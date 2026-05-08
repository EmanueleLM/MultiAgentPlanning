(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle
    truck airplane - vehicle
    package
    location
  )

  (:predicates
    ;; location predicates
    (at-package ?p - package ?l - location)
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)

    ;; containment: a package is in a vehicle
    (in ?p - package ?v - vehicle)

    ;; package availability: true iff package is not currently loaded in any vehicle
    (available ?p - package)

    ;; connectivity predicates (domain-independent topology facts; specific edges provided in problem)
    (road ?from - location ?to - location)
    (air-route ?from - location ?to - location)
  )

  ;; TRUCK actions: distinct names prefixed with "truck-"
  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-package ?p ?l)
      (available ?p)
    )
    :effect (and
      (in ?p ?t)
      (not (at-package ?p ?l))
      (not (available ?p))
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
      (available ?p)
      (not (in ?p ?t))
    )
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
      (at-truck ?t ?from)
      (road ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; AIRPLANE actions: distinct names prefixed with "plane-"
  (:action plane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-plane ?a ?l)
      (at-package ?p ?l)
      (available ?p)
    )
    :effect (and
      (in ?p ?a)
      (not (at-package ?p ?l))
      (not (available ?p))
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
      (available ?p)
      (not (in ?p ?a))
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?a ?from)
      (air-route ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (at-plane ?a ?to)
      (not (at-plane ?a ?from))
    )
  )
)