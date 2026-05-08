(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (at_pkg ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)
    (at_truck ?t - truck ?l - location)
    (at_plane ?a - airplane ?l - location)
    (in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Load a package into a truck located at the same location.
  ;; Negative preconditions enumerate all vehicles in the instance to prevent loading if already loaded.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_truck ?t ?l)
      ;; package must not already be in any truck (enumerated explicitly)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      ;; package must not already be in any airplane (enumerated explicitly)
      (not (in_plane ?p airplane_0))
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_pkg ?p ?l)
    )
  )

  ;; Load a package into an airplane at the same location (airport or not; airport check not required by load).
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_plane ?a ?l)
      ;; package must not already be in any airplane (enumerated explicitly)
      (not (in_plane ?p airplane_0))
      ;; package must not already be in any truck (enumerated explicitly)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in_plane ?p ?a)
    )
  )

  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?l)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at_pkg ?p ?l)
    )
  )

  ;; Drive a truck between two locations that belong to the same city.
  ;; Connectivity is implicit: any two locations in the same city are directly connected.
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

  ;; Fly an airplane between airports.
  (:action fly_airplane
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