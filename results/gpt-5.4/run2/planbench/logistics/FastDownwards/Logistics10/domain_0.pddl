(define (domain logistics_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    thing
    city location - thing
    package vehicle - thing
    truck airplane - vehicle
  )

  (:predicates
    (in_city ?l - location ?c - city)
    (airport ?l - location)

    (at_pkg ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)

    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_truck ?t ?l)
      (not (in_truck ?p ?t))
    )
    :effect (and
      (in_truck ?p ?t)
      (not (at_pkg ?p ?l))
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
      (not (at_pkg ?p ?l))
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_truck ?p ?t))
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_airplane ?a ?l)
      (not (in_airplane ?p ?a))
    )
    :effect (and
      (in_airplane ?p ?a)
      (not (at_pkg ?p ?l))
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
      (not (at_pkg ?p ?l))
    )
    :effect (and
      (at_pkg ?p ?l)
      (not (in_airplane ?p ?a))
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_truck ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (at_truck ?t ?to))
    )
    :effect (and
      (at_truck ?t ?to)
      (not (at_truck ?t ?from))
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (at_airplane ?a ?to))
    )
    :effect (and
      (at_airplane ?a ?to)
      (not (at_airplane ?a ?from))
    )
  )
)