(define (domain logistics20)
  (:requirements :strips :typing :negative-preconditions)

  (:types city location truck airplane package)

  (:predicates
    (loc_in_city ?l - location ?c - city)
    (airport ?l - location)
    (connected_road ?l1 - location ?l2 - location)
    (connected_air ?l1 - location ?l2 - location)
    (truck_at ?t - truck ?l - location)
    (plane_at ?a - airplane ?l - location)
    (at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (free ?p - package)
  )

  (:action truck_load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck_at ?t ?loc)
      (at ?p ?loc)
      (free ?p)
    )
    :effect (and
      (not (at ?p ?loc))
      (in_truck ?p ?t)
      (not (free ?p))
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck_at ?t ?loc)
      (in_truck ?p ?t)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?loc)
      (free ?p)
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (connected_road ?from ?to)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  (:action plane_load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (plane_at ?a ?loc)
      (airport ?loc)
      (at ?p ?loc)
      (free ?p)
    )
    :effect (and
      (not (at ?p ?loc))
      (in_plane ?p ?a)
      (not (free ?p))
    )
  )

  (:action plane_unload
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (plane_at ?a ?loc)
      (airport ?loc)
      (in_plane ?p ?a)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at ?p ?loc)
      (free ?p)
    )
  )

  (:action plane_fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (plane_at ?a ?from)
      (airport ?from)
      (airport ?to)
      (connected_air ?from ?to)
    )
    :effect (and
      (not (plane_at ?a ?from))
      (plane_at ?a ?to)
    )
  )
)