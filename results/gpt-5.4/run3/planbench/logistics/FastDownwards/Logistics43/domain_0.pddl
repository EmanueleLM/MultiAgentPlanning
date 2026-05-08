(define (domain logistics_instance)
  (:requirements :strips :typing)

  (:types
    location city package vehicle truck airplane - object
  )

  (:predicates
    (at_pkg ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (airport ?l - location)
    (in_city ?l - location ?c - city)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_pkg ?p ?l)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (at_pkg ?p ?l))
      (in ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at_truck ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
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
      (in ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at_airplane ?a ?l)
    )
    :effect (and
      (not (in ?p ?a))
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