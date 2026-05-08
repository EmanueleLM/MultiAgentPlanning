(define (domain logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location package truck airplane
  )

  (:predicates
    ;; vehicle locations (separate predicates for trucks and airplanes)
    (at_truck ?t - truck ?l - location)
    (at_plane ?a - airplane ?l - location)

    ;; package at a location
    (at_pkg ?p - package ?l - location)

    ;; package loaded into vehicles
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)

    ;; airport marker and location->city relation
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
  )

  ;; Truck actions (operate only within a city)
  (:action truck_agent_load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at_truck ?t ?loc)
      (at_pkg ?p ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  (:action truck_agent_unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at_truck ?t ?loc)
      (in_truck ?p ?t)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_pkg ?p ?loc)
    )
  )

  (:action truck_agent_drive
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

  ;; Airplane actions (operate between airports)
  (:action airplane_agent_load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at_plane ?a ?loc)
      (at_pkg ?p ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in_plane ?p ?a)
    )
  )

  (:action airplane_agent_unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (at_plane ?a ?loc)
      (in_plane ?p ?a)
      (airport ?loc)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at_pkg ?p ?loc)
    )
  )

  (:action airplane_agent_fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_plane ?a ?from))
      (at_plane ?a ?to)
    )
  )
)