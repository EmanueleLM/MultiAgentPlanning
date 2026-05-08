(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city
    location
    package
    truck
    airplane
  )
  (:predicates
    (at ?obj - (either package truck airplane) ?loc - location)
    (in ?pkg - package ?veh - (either truck airplane))
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
      (not (in ?p ?t))
      (at ?p ?l)
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
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from_l - location ?to_l - location ?c - city)
    :precondition (and
      (at ?t ?from_l)
      (in_city ?from_l ?c)
      (in_city ?to_l ?c)
      (not (= ?from_l ?to_l)) ; truck must move to a different location
    )
    :effect (and
      (not (at ?t ?from_l))
      (at ?t ?to_l)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from_l - location ?to_l - location)
    :precondition (and
      (at ?a ?from_l)
      (is_airport ?from_l)
      (is_airport ?to_l)
      (not (= ?from_l ?to_l)) ; airplane must fly to a different airport
    )
    :effect (and
      (not (at ?a ?from_l))
      (at ?a ?to_l)
    )
  )