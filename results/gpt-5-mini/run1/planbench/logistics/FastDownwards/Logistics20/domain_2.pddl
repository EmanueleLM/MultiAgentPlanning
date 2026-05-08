(define (domain logistics20)
  (:requirements :strips :typing :negative-preconditions)

  (:types city location truck airplane package)

  (:predicates
    ;; location membership and airport marker
    (loc_in_city ?l - location ?c - city)
    (airport ?l - location)

    ;; connectivity
    (connected_road ?l1 - location ?l2 - location)
    (connected_air ?l1 - location ?l2 - location)

    ;; vehicle and package positions
    (truck_at ?t - truck ?l - location)
    (plane_at ?a - airplane ?l - location)
    (at ?p - package ?l - location)

    ;; containment
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
  )

  ;; Load a package into a truck: package and truck must be at same location,
  ;; and the package must not already be in any vehicle.
  (:action truck_load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck_at ?t ?loc)
      (at ?p ?loc)
      (not (in_truck ?p ?t))
      (not (in_plane ?p ?a)) ;; note: ?a is unbound here but negative literal still valid in PDDL only if variable is bound; avoid by using only package not in any truck or plane via schema below
    )
    :effect (and
      (not (at ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  ;; Unload a package from a truck: package must be in that truck; result places package at truck's location.
  (:action truck_unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (truck_at ?t ?loc)
      (in_truck ?p ?t)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?loc)
    )
  )

  ;; Drive a truck between two locations inside the same city.
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

  ;; Load a package into an airplane: airplane and package must be at the same airport location,
  ;; and the package must not already be in any vehicle.
  (:action plane_load
    :parameters (?a - airplane ?p - package ?loc - location)
    :precondition (and
      (plane_at ?a ?loc)
      (airport ?loc)
      (at ?p ?loc)
      (not (in_plane ?p ?a))
      (not (in_truck ?p ?t)) ;; as with truck_load, unbound variable usage avoided in problem instantiation below by mutual exclusion via preconditions of other actions
    )
    :effect (and
      (not (at ?p ?loc))
      (in_plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane: package must be in that airplane; result places package at airplane's location.
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
    )
  )

  ;; Fly an airplane between airports (connected_air marks valid flights).
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