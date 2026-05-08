(define (domain logistics33)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    city
    location
    truck - vehicle
    airplane - vehicle
    vehicle - object
  )

  (:predicates
    (at ?obj - (or package truck airplane) ?loc - location)
    (in ?pkg - package ?veh - (or truck airplane))
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
    (truck_of_city ?truck - truck ?city - city)
  )

  (:action load_package_truck
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

  (:action load_package_airplane
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

  (:action unload_package_truck
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

  (:action unload_package_airplane
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
      (truck_of_city ?t ?c)
      (not (= ?from_l ?to_l))
    )
    :effect (and
      (not (at ?t ?from_l))
      (at ?t ?to_l)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from_l - location ?to_l - location ?from_c - city ?to_c - city)
    :precondition (and
      (at ?a ?from_l)
      (is_airport ?from_l)
      (is_airport ?to_l)
      (in_city ?from_l ?from_c)
      (in_city ?to_l ?to_c)
      (not (= ?from_c ?to_c))
      (not (= ?from_l ?to_l))
    )
    :effect (and
      (not (at ?a ?from_l))
      (at ?a ?to_l)
    )
  )
)