(define (domain logistics_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    city
    location
    vehicle
    truck - vehicle
    airplane - vehicle
  )

  (:predicates
    (at ?obj - (or package vehicle) ?loc - location)
    (in ?p - package ?v - vehicle)
    (is_airport ?l - location)
    (loc_in_city ?l - location ?c - city)
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

  (:action unload_package_truck
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

  (:action unload_package_airplane
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
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
      (not (= ?from ?to))
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
      (loc_in_city ?from ?c_from)
      (loc_in_city ?to ?c_to)
      (not (= ?c_from ?c_to))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)