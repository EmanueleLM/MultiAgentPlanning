(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types location city package truck airplane)
  (:predicates
    (is_airport ?l - location)
    (in_city ?l - location ?c - city)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (at_package ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
  )

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

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_airplane ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at_airplane ?a ?from))
      (at_airplane ?a ?to)
    )
  )
)