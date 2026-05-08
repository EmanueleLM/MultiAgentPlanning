(define (domain logistics28)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    (truck_at ?t - truck ?l - location)
    (plane_at ?a - airplane ?l - location)
    (pkg_at ?p - package ?l - location)
    (in_truck ?t - truck ?p - package)
    (in_plane ?a - airplane ?p - package)
    (airport ?l - location)
    (loc_in_city ?l - location ?c - city)
    (same_city ?l1 - location ?l2 - location)
    (diff_city ?l1 - location ?l2 - location)
  )

  (:action truck-load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (truck_at ?t ?l) (pkg_at ?p ?l))
    :effect (and (in_truck ?t ?p) (not (pkg_at ?p ?l)))
  )

  (:action truck-unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (truck_at ?t ?l) (in_truck ?t ?p))
    :effect (and (pkg_at ?p ?l) (not (in_truck ?t ?p)))
  )

  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and (truck_at ?t ?from) (same_city ?from ?to))
    :effect (and (truck_at ?t ?to) (not (truck_at ?t ?from)))
  )

  (:action airplane-load
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (plane_at ?a ?l) (airport ?l) (pkg_at ?p ?l))
    :effect (and (in_plane ?a ?p) (not (pkg_at ?p ?l)))
  )

  (:action airplane-unload
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (plane_at ?a ?l) (airport ?l) (in_plane ?a ?p))
    :effect (and (pkg_at ?p ?l) (not (in_plane ?a ?p)))
  )

  (:action airplane-fly
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (plane_at ?a ?from) (airport ?from) (airport ?to) (diff_city ?from ?to))
    :effect (and (plane_at ?a ?to) (not (plane_at ?a ?from)))
  )
)