(define (domain logistics8)
  (:requirements :strips :typing)
  (:types
    city
    location
    vehicle
    truck - vehicle
    plane - vehicle
    package
  )

  (:predicates
    ;; static relations
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)

    ;; vehicle locations (truck or plane)
    (at ?v - vehicle ?loc - location)

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
      (at ?tr ?loc)
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
      (at ?tr ?loc)
    )
    :effect (and
      (not (in_truck ?p ?tr))
      (at_package ?p ?loc)
    )
  )

  (:action drive_truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?tr ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
    )
  )

  ;; Airplane actions
  (:action load_plane
    :parameters (?p - package ?pl - plane ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at ?pl ?loc)
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
      (at ?pl ?loc)
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
      (at ?pl ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?pl ?from))
      (at ?pl ?to)
    )
  )
)