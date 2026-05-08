(define (domain logistics36)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location package truck airplane)
  (:predicates
    (location_in_city ?loc - location ?c - city)
    (airport ?loc - location)
    (at_truck ?t - truck ?loc - location)
    (at_plane ?a - airplane ?loc - location)
    (at_pkg ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_truck ?t ?loc)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?loc))
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?loc)
    )
    :effect (and
      (at_pkg ?p ?loc)
      (not (in_truck ?p ?t))
    )
  )

  (:action load_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at_plane ?a ?loc)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at_pkg ?p ?loc))
    )
  )

  (:action unload_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?loc)
    )
    :effect (and
      (at_pkg ?p ?loc)
      (not (in_plane ?p ?a))
    )
  )

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