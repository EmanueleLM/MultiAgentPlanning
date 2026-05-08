(define (domain logistics25)
  (:requirements :strips :typing)
  (:types package location truck airplane city)

  (:predicates
    ;; where packages and vehicles are
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)

    (truck_at ?t - truck ?l - location)
    (plane_at ?a - airplane ?l - location)

    ;; map locations to cities and mark airports
    (loc_in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Load/unload for trucks
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (package_at ?p ?l)
    )
  )

  ;; Drive truck between two locations inside the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  ;; Load/unload for airplanes (only at airports)
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (plane_at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (package_at ?p ?l))
      (in_plane ?p ?a)
    )
  )

  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (plane_at ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (package_at ?p ?l)
    )
  )

  ;; Fly airplane between airport locations (airports are locations in some city)
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location ?cfrom - city ?cto - city)
    :precondition (and
      (plane_at ?a ?from)
      (airport ?from)
      (airport ?to)
      (loc_in_city ?from ?cfrom)
      (loc_in_city ?to ?cto)
    )
    :effect (and
      (not (plane_at ?a ?from))
      (plane_at ?a ?to)
    )
  )
)