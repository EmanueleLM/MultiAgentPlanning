(define (domain truck_airplane_logistics)
  (:requirements :strips :typing)
  (:types
    city
    location
    truck
    airplane
    package
  )

  (:predicates
    ;; location and city membership
    (airport ?loc - location)
    (location_in_city ?loc - location ?c - city)

    ;; vehicle and package locations (separate predicates to keep invariants explicit)
    (at_truck ?tr - truck ?loc - location)
    (at_plane ?ap - airplane ?loc - location)
    (at_package ?p - package ?loc - location)

    ;; package-in-vehicle relations
    (in_truck ?p - package ?tr - truck)
    (in_plane ?p - package ?ap - airplane)
  )

  ;; Truck actions: load, unload, drive (drive only between locations in same city)
  (:action truck-load
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

  (:action truck-unload
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

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?tr ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?tr ?from))
      (at_truck ?tr ?to)
    )
  )

  ;; Airplane actions: load, unload, fly (fly between any two airports)
  (:action plane-load
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_plane ?ap ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_plane ?p ?ap)
    )
  )

  (:action plane-unload
    :parameters (?p - package ?ap - airplane ?loc - location)
    :precondition (and
      (in_plane ?p ?ap)
      (at_plane ?ap ?loc)
    )
    :effect (and
      (not (in_plane ?p ?ap))
      (at_package ?p ?loc)
    )
  )

  (:action plane-fly
    :parameters (?ap - airplane ?src - location ?dst - location)
    :precondition (and
      (at_plane ?ap ?src)
      (airport ?src)
      (airport ?dst)
    )
    :effect (and
      (not (at_plane ?ap ?src))
      (at_plane ?ap ?dst)
    )
  )
)