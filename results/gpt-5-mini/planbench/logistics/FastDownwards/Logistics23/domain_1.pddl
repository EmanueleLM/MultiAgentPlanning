(define (domain logistics23)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck plane package location city)

  (:predicates
    (at_truck ?t - truck ?l - location)
    (at_plane ?a - plane ?l - location)
    (at_pkg ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - plane)
    (loc_in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Truck actions
  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at_truck ?t ?l)
      (at_pkg ?p ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?l))
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at_truck ?t ?l)
      (in_truck ?p ?t)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; Airplane actions
  (:action plane_load
    :parameters (?a - plane ?p - package ?l - location)
    :precondition (and
      (at_plane ?a ?l)
      (at_pkg ?p ?l)
      (airport ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at_pkg ?p ?l))
    )
  )

  (:action plane_unload
    :parameters (?a - plane ?p - package ?l - location)
    :precondition (and
      (at_plane ?a ?l)
      (in_plane ?p ?a)
      (airport ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  (:action plane_fly
    :parameters (?a - plane ?from - location ?to - location)
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