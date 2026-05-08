(define (domain jack_of_all_trades_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (at_pkg ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Load a package into a truck: package and truck must be co-located.
  (:action load_into_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?l))
    )
  )

  ;; Unload a package from a truck: package must be in the truck and the truck at the location.
  (:action unload_from_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_pkg ?p ?l)
    )
  )

  ;; Load a package into an airplane: package and airplane must be co-located.
  (:action load_into_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_airplane ?a ?l)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at_pkg ?p ?l))
    )
  )

  ;; Unload a package from an airplane: package must be in the airplane and the airplane at the location.
  (:action unload_from_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_pkg ?p ?l)
    )
  )

  ;; Drive a truck between two locations in the same city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; Fly an airplane between two airport locations.
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at_airplane ?a ?to)
      (not (at_airplane ?a ?from))
    )
  )
)