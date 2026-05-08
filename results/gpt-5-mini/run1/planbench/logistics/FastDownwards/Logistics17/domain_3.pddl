(define (domain logistics_orchestrated)
  :requirements :strips :typing
  :types city location truck airplane package

  :predicates
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (at_package ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (location_in_city ?l - location ?c - city)
    (is_airport ?l - location)
    (different_city ?l1 - location ?l2 - location)
  )

  ;; Drive a truck between two locations in the same city.
  (:action drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Load a package into a truck at the truck's current location.
  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_truck ?t ?loc)
      (at_package ?p ?loc)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_package ?p ?loc))
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?loc)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_package ?p ?loc)
    )
  )

  ;; Fly an airplane between two different-city airports.
  (:action fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (different_city ?from ?to)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )

  ;; Load a package into an airplane at an airport.
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at_airplane ?a ?loc)
      (is_airport ?loc)
      (at_package ?p ?loc)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at_package ?p ?loc))
    )
  )

  ;; Unload a package from an airplane to the airport location.
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?loc)
      (is_airport ?loc)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_package ?p ?loc)
    )
  )
)