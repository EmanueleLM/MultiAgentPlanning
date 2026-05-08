(define (domain logistics_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    package truck airplane location city
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

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_airplane ?a ?l)
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at_airplane ?a ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at_pkg ?p ?l)
    )
  )

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