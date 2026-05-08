(define (domain logistics20)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    ;; vehicle and package location predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; containment predicates
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)

    ;; static predicates
    (airport ?l - location)
    (in-city ?l - location ?c - city)

    ;; explicit allowed flight connections between airports
    (flight-route ?from - location ?to - location)
  )

  ;; Load a package into a truck.
  ;; Preconditions: truck and package co-located at ?loc.
  ;; Effects: package is in the truck and no longer at the location.
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

  ;; Unload a package from a truck.
  ;; Preconditions: truck at ?loc and package in that truck.
  ;; Effects: package is at the truck's location and removed from the truck.
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

  ;; Drive a truck between two locations in the same city.
  ;; Preconditions: truck at from-location, both locations in same city.
  ;; Effects: truck at to-location and not at from-location.
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

  ;; Load a package into an airplane (at an airport).
  ;; Preconditions: airplane and package co-located at an airport location.
  ;; Effects: package is in the airplane and removed from the airport location.
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

  ;; Unload a package from an airplane (at an airport).
  ;; Preconditions: airplane at an airport and package in that airplane.
  ;; Effects: package is at the airport location and removed from the airplane.
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

  ;; Fly an airplane between two airports that have an explicit flight route.
  ;; Preconditions: airplane at from-airport; both endpoints are airports and route exists.
  ;; Effects: airplane at to-airport and not at from-airport.
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