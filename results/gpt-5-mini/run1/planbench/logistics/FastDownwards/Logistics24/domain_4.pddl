(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    object
    package - object
    vehicle - object
    truck airplane - vehicle
    location
    city
  )

  (:predicates
    (at ?o - object ?l - location)
    (in_vehicle ?p - package ?v - vehicle)
    (loc_in_city ?l - location ?c - city)
    (is_airport ?l - location)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action load_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (at ?p ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in_vehicle ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (in_vehicle ?p ?t)
    )
    :effect (and
      (not (in_vehicle ?p ?t))
      (at ?p ?l)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action load_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (at ?p ?l)
      (is_airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in_vehicle ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (in_vehicle ?p ?a)
      (is_airport ?l)
    )
    :effect (and
      (not (in_vehicle ?p ?a))
      (at ?p ?l)
    )
  )
)