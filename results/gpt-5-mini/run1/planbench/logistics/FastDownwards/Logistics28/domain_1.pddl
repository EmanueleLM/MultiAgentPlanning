(define (domain intermodal-transport)
  (:requirements :strips :typing)
  (:types truck airplane package location city)

  (:predicates
    ;; vehicle and package locations
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; containment: package inside a vehicle
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; simple capacity flags to enforce single-package capacity
    (truck-empty ?t - truck)
    (airplane-empty ?a - airplane)

    ;; topology / classification
    (loc-city ?l - location ?c - city)
    (is-airport ?l - location)
  )

  ;; Drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (loc-city ?from ?c)
      (loc-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Load a single package into a truck (capacity = 1)
  (:action load-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (at-package ?p ?l)
      (truck-empty ?t)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
      (not (truck-empty ?t))
    )
  )

  ;; Unload a package from a truck to the truck's current location
  (:action unload-truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-truck ?p ?t))
      (truck-empty ?t)
    )
  )

  ;; Load a single package into an airplane at an airport (capacity = 1)
  (:action load-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-airplane ?a ?l)
      (at-package ?p ?l)
      (is-airport ?l)
      (airplane-empty ?a)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-airplane ?p ?a)
      (not (airplane-empty ?a))
    )
  )

  ;; Unload a package from an airplane at an airport
  (:action unload-airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at-airplane ?a ?l)
      (in-airplane ?p ?a)
      (is-airport ?l)
    )
    :effect (and
      (at-package ?p ?l)
      (not (in-airplane ?p ?a))
      (airplane-empty ?a)
    )
  )

  ;; Fly an airplane between two airports
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)