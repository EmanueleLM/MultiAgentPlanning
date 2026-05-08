(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types object package truck airplane location city)
  (:predicates
    (at ?o - object ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (airport ?l - location)
    (in_city ?l - location ?c - city)
  )

  ; Load a package into a truck: package and truck must be co-located,
  ; and package must not already be in any truck or any airplane.
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
      ; package not already in any truck (expanded for this instance)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
      ; package not already in any airplane (expanded for this instance)
      (not (in_airplane ?p airplane_0))
      (not (in_airplane ?p airplane_1))
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at ?p ?l))
    )
  )

  ; Unload a package from a truck: package must be in the truck; truck must be at the location.
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?l)
    )
  )

  ; Load a package into an airplane: package and airplane must be co-located,
  ; and package must not already be in any truck or any airplane.
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
      ; package not already in any airplane (expanded for this instance)
      (not (in_airplane ?p airplane_0))
      (not (in_airplane ?p airplane_1))
      ; package not already in any truck (expanded for this instance)
      (not (in_truck ?p truck_0))
      (not (in_truck ?p truck_1))
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at ?p ?l))
    )
  )

  ; Unload a package from an airplane: package must be in the airplane; airplane must be at the location.
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at ?p ?l)
    )
  )

  ; Drive a truck between two locations in the same city.
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  ; Fly an airplane between two airport locations.
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )
)