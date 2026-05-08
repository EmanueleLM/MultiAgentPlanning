(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane - thing
    location city
  )
  (:predicates
    (at ?o - thing ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
    (truck_of_city ?t - truck ?c - city)
  )

  ;; Load a package into a truck: package and truck must be at same location,
  ;; and package must not already be in any truck or any airplane.
  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?t ?loc)
      ;; package not already in any truck (enumerated for this instance)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      ;; package not already in any airplane (enumerated for this instance)
      (not (in_plane ?p airplane_0))
      (not (in_plane ?p airplane_1))
    )
    :effect (and
      (not (at ?p ?loc))
      (in_truck ?p ?t)
    )
  )

  ;; Unload a package from a truck: package must be in the truck and truck at location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in_truck ?p ?t)
      (at ?t ?loc)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?loc)
    )
  )

  ;; Drive a truck from one location to another within its city.
  ;; Enforce truck stays in its assigned city via truck_of_city mapping.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (truck_of_city ?t ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  ;; Load a package into an airplane: package and airplane must be at same airport location,
  ;; and package must not already be in any airplane or any truck.
  (:action load_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at ?p ?loc)
      (at ?a ?loc)
      (airport ?loc)
      ;; package not in any airplane (enumerated)
      (not (in_plane ?p airplane_0))
      (not (in_plane ?p airplane_1))
      ;; package not in any truck (enumerated)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
    )
    :effect (and
      (not (at ?p ?loc))
      (in_plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane at an airport.
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in_plane ?p ?a)
      (at ?a ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at ?p ?loc)
    )
  )

  ;; Fly an airplane between airports.
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)