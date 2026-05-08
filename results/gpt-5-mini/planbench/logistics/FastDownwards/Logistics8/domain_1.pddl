(define (domain logistics8)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck plane - vehicle
    package
  )

  (:predicates
    ;; static
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)

    ;; dynamic
    (at ?v - vehicle ?loc - location)      ;; vehicles (trucks and planes)
    (at_pkg ?p - package ?loc - location) ;; packages at a location
    (in ?p - package ?v - vehicle)        ;; package inside a vehicle
    (free ?v - vehicle)                   ;; vehicle has free capacity (capacity = 1)
  )

  ;; Truck actions
  (:action load_truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (at_pkg ?p ?loc)
      (at ?tr ?loc)
      (free ?tr)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?tr)
      (not (free ?tr))
    )
  )

  (:action unload_truck
    :parameters (?p - package ?tr - truck ?loc - location)
    :precondition (and
      (in ?p ?tr)
      (at ?tr ?loc)
    )
    :effect (and
      (not (in ?p ?tr))
      (at_pkg ?p ?loc)
      (free ?tr)
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
      (at_pkg ?p ?loc)
      (at ?pl ?loc)
      (airport ?loc)
      (free ?pl)
    )
    :effect (and
      (not (at_pkg ?p ?loc))
      (in ?p ?pl)
      (not (free ?pl))
    )
  )

  (:action unload_plane
    :parameters (?p - package ?pl - plane ?loc - location)
    :precondition (and
      (in ?p ?pl)
      (at ?pl ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in ?p ?pl))
      (at_pkg ?p ?loc)
      (free ?pl)
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