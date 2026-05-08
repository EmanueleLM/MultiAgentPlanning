(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (location_in_city ?l - location ?c - city)
    (is_airport ?l - location)
  )

  (:action load_into_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (truck_at ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (package_at ?p ?l))
    )
  )

  (:action unload_from_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action load_into_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (airplane_at ?a ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (package_at ?p ?l))
    )
  )

  (:action unload_from_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (airplane_at ?a ?l)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
      (airplane_at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (location_in_city ?from ?c_from)
      (location_in_city ?to ?c_to)
    )
    :effect (and
      (airplane_at ?a ?to)
      (not (airplane_at ?a ?from))
    )
  )
)