(define (domain logistics_instance)
  (:requirements :strips :typing)
  (:types
    city
    location
    package
    vehicle
    truck airplane - vehicle
  )

  (:predicates
    (at ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (truck_at ?t - truck ?l - location)
    (airplane_at ?a - airplane ?l - location)
    (in_city ?l - location ?c - city)
    (airport ?l - location)
    (truck_in_city ?t - truck ?c - city)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (truck_at ?t ?l)
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?l)
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (airplane_at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (airplane_at ?a ?l)
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (truck_at ?t ?from)
      (truck_in_city ?t ?c)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (truck_at ?t ?from))
      (truck_at ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (airplane_at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (airplane_at ?a ?from))
      (airplane_at ?a ?to)
    )
  )
)