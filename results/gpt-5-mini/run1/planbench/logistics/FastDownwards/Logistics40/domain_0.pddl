(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)

  (:predicates
    (location_in_city ?l - location ?c - city)
    (airport ?l - location)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (at_package ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
  )

  ;; Load a package into a truck: package and truck must be co-located
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

  ;; Unload a package from a truck: truck must be at a location; package is removed from truck and placed at that location
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

  ;; Load a package into an airplane: package and airplane must be co-located
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_airplane ?a ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  ;; Unload a package from an airplane: airplane must be at a location
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_package ?p ?l)
    )
  )

  ;; Drive a truck between two locations in the same city
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (location_in_city ?from ?c)
      (location_in_city ?to ?c)
    )
    :effect (and
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  ;; Fly an airplane between two airports
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)