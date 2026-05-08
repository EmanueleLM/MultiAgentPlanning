(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (at_package ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (at_truck ?t - truck ?l - location)
    (at_plane ?a - airplane ?l - location)
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
    (truck_of_city ?t - truck ?c - city)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_package ?p ?l))
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_plane ?a ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at_package ?p ?l))
    )
  )

  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (truck_of_city ?t ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at_plane ?a ?to)
      (not (at_plane ?a ?from))
    )
  )
)