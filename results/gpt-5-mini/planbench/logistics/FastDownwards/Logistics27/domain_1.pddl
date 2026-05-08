(define (domain logistics27)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city)

  (:predicates
    ;; vehicle and package location predicates
    (truck-at ?t - truck ?l - location)
    (airplane-at ?a - airplane ?l - location)
    (package-at ?pkg - package ?l - location)

    ;; containment predicates
    (in-truck ?pkg - package ?t - truck)
    (in-airplane ?pkg - package ?a - airplane)

    ;; structural predicates
    (in-city ?loc - location ?c - city)
    (airport ?loc - location)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Truck actions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Load a package into a truck: package and truck must be co-located.
  (:action truck-load
    :parameters (?t - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (package-at ?pkg ?loc)
    )
    :effect (and
      (in-truck ?pkg ?t)
      (not (package-at ?pkg ?loc))
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  (:action truck-unload
    :parameters (?t - truck ?pkg - package ?loc - location)
    :precondition (and
      (truck-at ?t ?loc)
      (in-truck ?pkg ?t)
    )
    :effect (and
      (package-at ?pkg ?loc)
      (not (in-truck ?pkg ?t))
    )
  )

  ;; Drive a truck between two locations in the same city.
  ;; The city parameter enforces that both locations are in the same city.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck-at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (truck-at ?t ?to)
      (not (truck-at ?t ?from))
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Airplane actions
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Load a package into an airplane at an airport location.
  (:action airplane-load
    :parameters (?a - airplane ?pkg - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (airport ?loc)
      (package-at ?pkg ?loc)
    )
    :effect (and
      (in-airplane ?pkg ?a)
      (not (package-at ?pkg ?loc))
    )
  )

  ;; Unload a package from an airplane to the airplane's current airport.
  (:action airplane-unload
    :parameters (?a - airplane ?pkg - package ?loc - location)
    :precondition (and
      (airplane-at ?a ?loc)
      (airport ?loc)
      (in-airplane ?pkg ?a)
    )
    :effect (and
      (package-at ?pkg ?loc)
      (not (in-airplane ?pkg ?a))
    )
  )

  ;; Fly an airplane between airports. Any airport-to-airport flight is allowed
  ;; (cities are modeled via in-city predicates; airports are per-city).
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane-at ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (airplane-at ?a ?to)
      (not (airplane-at ?a ?from))
    )
  )
)