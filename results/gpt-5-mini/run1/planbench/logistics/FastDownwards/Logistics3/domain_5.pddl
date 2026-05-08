(define (domain logistics3)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)
    (airport_connection ?from - location ?to - location)
    (at_vehicle ?v - vehicle ?loc - location)
    (at_package ?p - package ?loc - location)
    (in_vehicle ?p - package ?v - vehicle)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_vehicle ?t ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (in_vehicle ?p ?t)
      (not (at_package ?p ?l))
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_vehicle ?p ?t)
      (at_vehicle ?t ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in_vehicle ?p ?t))
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (airport ?l)
      (at_vehicle ?a ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (in_vehicle ?p ?a)
      (not (at_package ?p ?l))
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (airport ?l)
      (in_vehicle ?p ?a)
      (at_vehicle ?a ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in_vehicle ?p ?a))
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_vehicle ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at_vehicle ?t ?from))
      (at_vehicle ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at_vehicle ?a ?from)
      (airport ?from)
      (airport ?to)
      (airport_connection ?from ?to)
    )
    :effect (and
      (not (at_vehicle ?a ?from))
      (at_vehicle ?a ?to)
    )
  )
)