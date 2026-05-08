(define (domain jack_of_all_trades)
  (:requirements :strips :typing)
  (:types city location truck airplane package)

  (:predicates
    (in_city ?l - location ?c - city)
    (airport ?l - location)
    (truck_at ?t - truck ?l - location)
    (plane_at ?a - airplane ?l - location)
    (at_pkg ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
  )

  ;; load a package into a truck: package and truck must share the same location
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in_truck ?p ?t)
    )
  )

  ;; unload a package from a truck: package must be in truck; package becomes at truck's location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_pkg ?p ?l)
    )
  )

  ;; load a package into an airplane: package and airplane must share the same location (airport)
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (plane_at ?a ?l)
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in_plane ?p ?a)
    )
  )

  ;; unload a package from an airplane: package must be in airplane; package becomes at airplane's location
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (plane_at ?a ?l)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at_pkg ?p ?l)
    )
  )

  ;; drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  ;; fly an airplane between two airports
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (plane_at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (plane_at ?a ?from))
      (plane_at ?a ?to)
    )
  )
)