(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane - object
    location city - object
  )
  (:predicates
    (at ?o - object ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
    (truck_of_city ?t - truck ?c - city)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?t ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (at ?t ?loc)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?loc)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (truck_of_city ?t ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action load_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at ?p ?loc))
      (in_plane ?p ?a)
    )
  )

  (:action unload_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_plane ?p ?a)
      (at ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at ?p ?loc)
    )
  )

  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)