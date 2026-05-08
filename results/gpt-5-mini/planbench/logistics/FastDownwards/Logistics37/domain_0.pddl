(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  ;; Instance-specific vehicle constants (so negative preconditions can reference them explicitly)
  (:constants
    truck_0 truck_1 - truck
    airplane_0 - airplane
  )

  (:predicates
    (at ?p - package ?l - location)                 ; package p is at location l
    (truck_at ?t - truck ?l - location)             ; truck t is at location l
    (plane_at ?a - airplane ?l - location)          ; airplane a is at location l
    (in_truck ?p - package ?t - truck)              ; package p is loaded in truck t
    (in_plane ?p - package ?a - airplane)           ; package p is loaded in airplane a
    (in_city ?l - location ?c - city)               ; static: location l belongs to city c
    (airport ?l - location)                         ; static: location l is an airport
  )

  ;; Load a package into a truck: package and truck must be at same location,
  ;; and package must not already be in any truck or any airplane (expanded for this instance).
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (truck_at ?t ?l)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      (not (in_plane ?p airplane_0))
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at ?p ?l))
    )
  )

  ;; Unload a package from a truck: package must be in the truck and truck at the location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  ;; Load a package into an airplane: package and airplane must be at same location,
  ;; and package must not already be in any airplane or truck (expanded for this instance).
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (plane_at ?a ?l)
      (not (in_plane ?p airplane_0))
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
    )
    :effect (and
      (in_plane ?p ?a)
      (not (at ?p ?l))
    )
  )

  ;; Unload a package from an airplane: package must be in the airplane and plane at the location.
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (plane_at ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_plane ?p ?a))
    )
  )

  ;; Drive a truck between two locations in the same city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (truck_at ?t ?to)
      (not (truck_at ?t ?from))
    )
  )

  ;; Fly an airplane between two airports.
  (:action fly_plane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (plane_at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (plane_at ?a ?to)
      (not (plane_at ?a ?from))
    )
  )
)