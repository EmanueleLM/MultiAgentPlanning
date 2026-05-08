(define (domain logistics25)
  (:requirements :typing)
  (:types package location truck airplane city)

  (:constants
    truck_0 truck_1 - truck
    airplane_0 - airplane
  )

  (:predicates
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (truck_at ?t - truck ?l - location)
    (plane_at ?a - airplane ?l - location)
    (loc_in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  (:action load_truck_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (truck_at truck_0 ?l)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_truck ?p truck_0)
    )
  )

  (:action unload_truck_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (in_truck ?p truck_0)
      (truck_at truck_0 ?l)
    )
    :effect (and
      (not (in_truck ?p truck_0))
      (package_at ?p ?l)
    )
  )

  (:action drive_truck_0
    :parameters (?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at truck_0 ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (truck_at truck_0 ?from))
      (truck_at truck_0 ?to)
    )
  )

  (:action load_truck_1
    :parameters (?p - package ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (truck_at truck_1 ?l)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_truck ?p truck_1)
    )
  )

  (:action unload_truck_1
    :parameters (?p - package ?l - location)
    :precondition (and
      (in_truck ?p truck_1)
      (truck_at truck_1 ?l)
    )
    :effect (and
      (not (in_truck ?p truck_1))
      (package_at ?p ?l)
    )
  )

  (:action drive_truck_1
    :parameters (?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at truck_1 ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (truck_at truck_1 ?from))
      (truck_at truck_1 ?to)
    )
  )

  (:action load_plane_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (plane_at airplane_0 ?l)
      (airport ?l)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_plane ?p airplane_0)
    )
  )

  (:action unload_plane_0
    :parameters (?p - package ?l - location)
    :precondition (and
      (in_plane ?p airplane_0)
      (plane_at airplane_0 ?l)
      (airport ?l)
    )
    :effect (and
      (not (in_plane ?p airplane_0))
      (package_at ?p ?l)
    )
  )

  (:action fly_plane_0
    :parameters (?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (plane_at airplane_0 ?from)
      (airport ?from)
      (airport ?to)
      (loc_in_city ?from ?cfrom)
      (loc_in_city ?to ?cto)
    )
    :effect (and
      (not (plane_at airplane_0 ?from))
      (plane_at airplane_0 ?to)
    )
  )
)