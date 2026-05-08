(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    ;; package at a location (package is not in any vehicle)
    (at ?p - package ?l - location)

    ;; vehicle location predicates (separate to allow precise typing)
    (at_truck ?t - truck ?l - location)
    (at_plane ?a - airplane ?l - location)

    ;; package containment
    (in_truck ?p - package ?t - truck)
    (in_plane ?p - package ?a - airplane)

    ;; static location/city relations
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  ;; Load a package into a truck: package and truck must be co-located.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in_truck ?p ?t)
    )
  )

  ;; Unload a package from a truck: package must be in the truck; package appears at the truck's location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Load a package into an airplane: must be at same airport location.
  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at_plane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in_plane ?p ?a)
    )
  )

  ;; Unload a package from an airplane: package must be in the airplane; package appears at airplane's (airport) location.
  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_plane ?p ?a)
      (at_plane ?a ?l)
      (airport ?l)
    )
    :effect (and
      (not (in_plane ?p ?a))
      (at ?p ?l)
    )
  )

  ;; Drive a truck between two locations in the same city.
  ;; The negative precondition (not (at_truck ?t ?to)) prevents driving to the same location where the truck already is.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
      (not (at_truck ?t ?to))
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Fly an airplane between two airports.
  ;; The negative precondition (not (at_plane ?a ?to)) prevents flying to the same airport where the airplane already is.
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (at_plane ?a ?to))
    )
    :effect (and
      (not (at_plane ?a ?from))
      (at_plane ?a ?to)
    )
  )
)