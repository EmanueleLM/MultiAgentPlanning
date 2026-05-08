(define (domain logistics12)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    has_location ; Supertype for anything that can be at a location
    package - has_location
    vehicle - has_location ; Supertype for trucks and airplanes
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - has_location ?loc - location)
    (in ?p - package ?v - vehicle)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?t))
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (at ?p ?l)
      (not (in ?p ?a))
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
      (at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (in_city ?from ?c_from)
      (in_city ?to ?c_to)
      (not (= ?c_from ?c_to))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)