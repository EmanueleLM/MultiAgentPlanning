(define (domain logistics_instance_specific)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    location
    package
    truck
    airplane
  )

  (:predicates
    (at_package ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (in_city ?l - location ?c - city)
    (airport ?l - location)
    (different_city ?c1 - city ?c2 - city)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_truck ?t ?l)
      (not (in_truck ?p ?t))
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at_truck ?t ?l)
      (not (at_package ?p ?l))
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at_package ?p ?l)
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_airplane ?a ?l)
      (not (in_airplane ?p ?a))
    )
    :effect (and
      (not (at_package ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
      (not (at_package ?p ?l))
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_package ?p ?l)
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
      (not (at_truck ?t ?from))
      (at_truck ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition (and
      (at_airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (in_city ?from ?from_city)
      (in_city ?to ?to_city)
      (different_city ?from_city ?to_city)
      (not (at_airplane ?a ?to))
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)