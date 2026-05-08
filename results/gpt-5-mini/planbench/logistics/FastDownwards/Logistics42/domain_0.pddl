(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package airplane truck location city)

  (:predicates
    ;; static predicates
    (in_city ?loc - location ?city - city)
    (airport ?loc - location)
    (truck_in_city ?t - truck ?city - city)

    ;; state predicates
    (at_package ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (at_truck ?t - truck ?loc - location)
    (at_plane ?a - airplane ?loc - location)
  )

  ;; Load a package into a truck: package and truck must be co-located.
  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_truck ?t ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  ;; Unload a package from a truck: package must be in the truck; package becomes at the truck's location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?loc)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_package ?p ?loc)
    )
  )

  ;; Load a package into an airplane: package and airplane must be co-located.
  (:action load_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at_package ?p ?loc)
      (at_plane ?a ?loc)
    )
    :effect (and
      (not (at_package ?p ?loc))
      (in_plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane: package must be in the airplane; package becomes at the airplane's location.
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?loc)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at_package ?p ?loc)
    )
  )

  ;; Drive a truck between two locations in the same city. Truck is statically associated to a city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?city - city)
    :precondition (and
      (at_truck ?t ?from)
      (truck_in_city ?t ?city)
      (in_city ?from ?city)
      (in_city ?to ?city)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
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