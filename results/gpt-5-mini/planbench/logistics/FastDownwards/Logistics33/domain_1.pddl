(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (at_pkg ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (location_in ?l - location ?c - city)
    (airport ?l - location)
    (truck_of_city ?t - truck ?c - city)
  )

  ;; load a package into a truck at the truck's location
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in_truck ?p ?t)
    )
  )

  ;; unload a package from a truck to the truck's current location
  (:action unload_truck
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

  ;; load a package into an airplane when both are at the same location
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_airplane ?a ?l)
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  ;; unload a package from an airplane to the airplane's current location
  (:action unload_airplane
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

  ;; drive a truck between two locations in the same city; truck must be assigned to that city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in ?from ?c)
      (location_in ?to ?c)
      (truck_of_city ?t ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; fly an airplane between two airports
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)