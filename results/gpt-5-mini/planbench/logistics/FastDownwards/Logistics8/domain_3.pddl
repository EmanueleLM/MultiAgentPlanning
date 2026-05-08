(define (domain logistics8)
  (:requirements :strips :typing)
  (:types
    city
    location
    truck
    plane
    package
  )

  (:predicates
    ;; static
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)

    ;; vehicle locations
    (at_truck ?tr - truck ?loc - location)
    (at_plane ?pl - plane ?loc - location)

    ;; package state
    (at_package ?p - package ?loc - location)
    (in_truck ?p - package ?tr - truck)
    (in_plane ?p - package ?pl - plane)
  )

  ;; Truck actions
  (:action load_truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_truck ?tr ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_truck ?p ?tr)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?tr)
      (at_truck ?tr ?loc)
    )
    :effect (and
      (not (in_truck ?p ?tr))
      (at_package ?p ?loc)
    )
  )

  (:action drive_truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?tr ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Airplane actions
  (:action load_plane
    :parameters (?p - package ?pl - plane ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_plane ?pl ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_plane ?p ?pl)
    )
  )

  (:action unload_plane
    :parameters (?p - package ?pl - plane ?loc - location)
    :precondition (and
      (in_plane ?p ?pl)
      (at_plane ?pl ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in_plane ?p ?pl))
      (at_package ?p ?loc)
    )
  )

  (:action fly_plane
    :parameters (?pl - plane ?from - location ?to - location)
    :precondition (and
      (at_plane ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_plane ?pl ?from))
      (at_plane ?pl ?to)
    )
  )
)