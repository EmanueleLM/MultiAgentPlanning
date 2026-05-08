(define (domain logistics37)
  (:requirements :typing :negative-preconditions :strips)
  (:types package truck airplane location city)

  (:predicates
    ;; package at a location
    (at ?p - package ?l - location)
    ;; truck at a location
    (at_truck ?t - truck ?l - location)
    ;; airplane at a location (airports)
    (at_airplane ?a - airplane ?l - location)
    ;; package inside a truck
    (in_truck ?p - package ?t - truck)
    ;; package inside an airplane
    (in_airplane ?p - package ?a - airplane)
    ;; mapping from location to city
    (location_in_city ?l - location ?c - city)
    ;; airport marker for locations that are airports
    (airport ?l - location)
    ;; helper predicate: same city relation (reflexive facts provided in problem)
    (same_city ?c1 - city ?c2 - city)
  )

  ;; Load a package into a truck at the same location.
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at_truck ?t ?l))
    :effect (and (not (at ?p ?l)) (in_truck ?p ?t))
  )

  ;; Unload a package from a truck; the package appears at the truck's current location.
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in_truck ?p ?t) (at_truck ?t ?l))
    :effect (and (not (in_truck ?p ?t)) (at ?p ?l))
  )

  ;; Load a package into an airplane at the airplane's current location (airport).
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at_airplane ?a ?l))
    :effect (and (not (at ?p ?l)) (in_airplane ?p ?a))
  )

  ;; Unload a package from an airplane; the package appears at the airplane's current location.
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in_airplane ?p ?a) (at_airplane ?a ?l))
    :effect (and (not (in_airplane ?p ?a)) (at ?p ?l))
  )

  ;; Drive a truck between any two locations in the same city.
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at_truck ?t ?from) (location_in_city ?from ?c) (location_in_city ?to ?c))
    :effect (and (not (at_truck ?t ?from)) (at_truck ?t ?to))
  )

  ;; Fly an airplane between airports located in different cities.
  ;; The not(same_city ...) check enforces flights between distinct cities.
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (location_in_city ?from ?c_from)
      (location_in_city ?to ?c_to)
      (not (same_city ?c_from ?c_to))
    )
    :effect (and (not (at_airplane ?a ?from)) (at_airplane ?a ?to))
  )
)