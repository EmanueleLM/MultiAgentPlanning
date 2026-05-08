(define (domain logistics30)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    truck
    airplane
    location
    city
  )

  (:predicates
    (at ?obj - (or package truck airplane) ?loc - location)
    (in ?pkg - package ?veh - (or truck airplane))
    (in-city ?loc - location ?c - city)
    (is-airport ?l - location)
  )

  (:action load_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition
      (and
        (at ?p ?l)
        (at ?t ?l)
      )
    :effect
      (and
        (not (at ?p ?l))
        (in ?p ?t)
      )
  )

  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition
      (and
        (in ?p ?t)
        (at ?t ?l)
      )
    :effect
      (and
        (not (in ?p ?t))
        (at ?p ?l)
      )
  )

  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition
      (and
        (at ?p ?l)
        (at ?a ?l)
      )
    :effect
      (and
        (not (at ?p ?l))
        (in ?p ?a)
      )
  )

  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition
      (and
        (in ?p ?a)
        (at ?a ?l)
      )
    :effect
      (and
        (not (in ?p ?a))
        (at ?p ?l)
      )
  )

  (:action drive_truck
    :parameters (?t - truck ?from_l - location ?to_l - location ?c - city)
    :precondition
      (and
        (at ?t ?from_l)
        (in-city ?from_l ?c)
        (in-city ?to_l ?c)
        (not (= ?from_l ?to_l))
      )
    :effect
      (and
        (not (at ?t ?from_l))
        (at ?t ?to_l)
      )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from_l - location ?to_l - location ?from_c - city ?to_c - city)
    :precondition
      (and
        (at ?a ?from_l)
        (is-airport ?from_l)
        (is-airport ?to_l)
        (in-city ?from_l ?from_c)
        (in-city ?to_l ?to_c)
        (not (= ?from_c ?to_c))
        (not (= ?from_l ?to_l))
      )
    :effect
      (and
        (not (at ?a ?from_l))
        (at ?a ?to_l)
      )
  )
)