(define (domain logistics20)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
    (flight-route ?from - location ?to - location)
  )

  ;; Load a package into a truck: requires truck and package at same location.
  ;; The package is removed from the location and becomes in the truck.
  (:action load-into-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
    )
    :effect (and
      (in-truck ?p ?t)
      (not (at-package ?p ?loc))
    )
  )

  ;; Unload a package from a truck: requires truck be at the location and the package in that truck.
  ;; The package becomes at the truck's location and is removed from the truck.
  (:action unload-from-truck
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-truck ?p ?t))
    )
  )

  ;; Drive a truck between two locations inside the same city.
  ;; Requires truck at the from-location and both locations declared in the same city.
  ;; Effects move the truck to the to-location and remove it from the from-location.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (at-truck ?t ?to)
      (not (at-truck ?t ?from))
    )
  )

  ;; Load a package into an airplane: requires airplane and package at the same airport location.
  ;; The package is removed from the airport location and becomes in the airplane.
  (:action load-into-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at-plane ?a ?loc)
      (airport ?loc)
      (at-package ?p ?loc)
    )
    :effect (and
      (in-plane ?p ?a)
      (not (at-package ?p ?loc))
    )
  )

  ;; Unload a package from an airplane: requires airplane at the airport and package in that airplane.
  ;; The package becomes at the airplane's airport location and is removed from the airplane.
  (:action unload-from-plane
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at-plane ?a ?loc)
      (airport ?loc)
      (in-plane ?p ?a)
    )
    :effect (and
      (at-package ?p ?loc)
      (not (in-plane ?p ?a))
    )
  )

  ;; Fly an airplane between declared flight routes (both endpoints must be airports).
  ;; Requires airplane at the from-airport; moves airplane to the to-airport.
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (flight-route ?from ?to)
    )
    :effect (and
      (at-plane ?a ?to)
      (not (at-plane ?a ?from))
    )
  )
)