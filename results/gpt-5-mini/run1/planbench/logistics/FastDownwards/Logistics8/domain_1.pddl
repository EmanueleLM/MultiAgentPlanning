(define (domain logistics8)
  (:requirements :strips :typing)
  (:types package truck airplane location city)

  (:predicates
    (in_city ?l - location ?c - city)
    (airport ?l - location)

    (at_truck ?t - truck ?l - location)
    (at_plane ?a - airplane ?l - location)
    (at_package ?p - package ?l - location)

    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
  )

  ;; Load a package into a truck: package and truck must be co-located.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_truck ?p ?t)
    )
  )

  ;; Unload a package from a truck: package is removed from truck and placed at truck location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_package ?p ?l)
    )
  )

  ;; Drive a truck between two locations in the same city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Load a package into an airplane: package and airplane must be co-located at an airport.
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_plane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane: package is removed from airplane and placed at airplane location.
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?l)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at_package ?p ?l)
    )
  )

  ;; Fly an airplane between two airport locations.
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_plane ?a ?from))
      (at_plane ?a ?to)
    )
  )
)