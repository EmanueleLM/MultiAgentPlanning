(define (domain jack_of_all_trades)
  (:requirements :typing :strips :negative-preconditions)
  (:types
    package
    location
    city
    vehicle
    truck airplane - vehicle
  )

  (:predicates
    ;; package at a ground location
    (at_pkg ?p - package ?l - location)
    ;; truck at a location
    (at_truck ?t - truck ?l - location)
    ;; airplane at a location (airports)
    (at_plane ?a - airplane ?l - location)
    ;; package is inside a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)
    ;; location is an airport
    (airport ?l - location)
    ;; static mapping: location is in a city
    (location_in ?l - location ?c - city)
  )

  ;; load a package into a truck (package and truck must be co-located)
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (in ?p ?t)
      (not (at_pkg ?p ?l))
    )
  )

  ;; load a package into an airplane (package and airplane must be co-located)
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_plane ?a ?l)
    )
    :effect (and
      (in ?p ?a)
      (not (at_pkg ?p ?l))
    )
  )

  ;; unload a package from a truck: package ends up at the truck's current location
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in ?p ?t))
    )
  )

  ;; unload a package from an airplane: package ends up at the airplane's current location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at_plane ?a ?l)
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in ?p ?a))
    )
  )

  ;; drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in ?from ?c)
      (location_in ?to ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ;; fly an airplane between two airports (airplane must be at the from-airport)
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_plane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at_plane ?a ?to)
      (not (at_plane ?a ?from))
    )
  )
)