(define (domain logistics38)
  (:requirements :strips :typing)
  (:types
    city
    location
    package
    truck
    airplane
  )

  (:predicates
    ;; package is at a location
    (at_package ?p - package ?l - location)
    ;; truck is at a location
    (at_truck ?t - truck ?l - location)
    ;; airplane is at a location (airports only by semantics)
    (at_airplane ?a - airplane ?l - location)

    ;; package loaded into truck / airplane
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    ;; airport marker and location->city relation
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
  )

  ;; load a package into a truck when both are at the same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_truck ?p ?t)
    )
  )

  ;; unload a package from a truck: package becomes at the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_package ?p ?l)
    )
  )

  ;; load a package into an airplane (airplane and package must be at the same airport location)
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  ;; unload a package from an airplane (package becomes at the airplane's current airport location)
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_package ?p ?l)
    )
  )

  ;; drive a truck between two locations in the same city (direct connectivity within a city)
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; fly an airplane between two airports (inter-city flights between airport locations)
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (loc_in_city ?from ?cfrom)
      (loc_in_city ?to ?cto)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)