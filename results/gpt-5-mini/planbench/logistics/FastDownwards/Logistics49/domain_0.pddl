(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (package_at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (truck_at ?t - truck ?l - location)
    (plane_at ?a - airplane ?l - location)
    (location_in_city ?l - location ?c - city)
    (is_airport ?l - location)
  )

  ;; Load a package into a truck at a location where both are present.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (truck_at ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (package_at ?p ?l))
    )
  )

  ;; Unload a package from a truck to the truck's current location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  ;; Load a package into an airplane at a location where both are present.
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (package_at ?p ?l)
      (plane_at ?a ?l)
    )
    :effect (and
      (in_plane ?p ?a)
      (not (package_at ?p ?l))
    )
  )

  ;; Unload a package from an airplane to the airplane's current location.
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (plane_at ?a ?l)
    )
    :effect (and
      (package_at ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  ;; Drive a truck between two locations that are in the same city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  ;; Fly an airplane between two airport locations.
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (plane_at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (plane_at ?a ?to)
      (not (plane_at ?a ?from))
    )
  )
)