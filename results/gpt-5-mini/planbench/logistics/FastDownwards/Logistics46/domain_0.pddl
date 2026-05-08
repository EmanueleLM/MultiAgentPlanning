(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)

  (:predicates
    (at ?p - package ?l - location)                 ; package is at location (not in any vehicle)
    (in_truck ?p - package ?t - truck)             ; package is inside a truck
    (in_airplane ?p - package ?a - airplane)       ; package is inside an airplane
    (at_truck ?t - truck ?l - location)            ; truck is at a specific location
    (at_airplane ?a - airplane ?l - location)      ; airplane is at a specific location
    (airport ?l - location)                         ; location is an airport
    (in_city ?l - location ?c - city)               ; location belongs to a city
  )

  ; load package into truck: package and truck must be at the same location
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at ?p ?l))
    )
  )

  ; unload package from truck: package in truck and truck at location
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  ; load package into airplane: package and airplane at same location
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at_airplane ?a ?l)
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at ?p ?l))
    )
  )

  ; unload package from airplane: package in airplane and airplane at location
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in_airplane ?p ?a))
    )
  )

  ; drive a truck between two locations in the same city
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  ; fly an airplane between two airport locations
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (at_airplane ?a ?to)
      (not (at_airplane ?a ?from))
    )
  )
)