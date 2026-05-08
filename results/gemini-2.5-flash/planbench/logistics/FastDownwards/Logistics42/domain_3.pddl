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
    (at_package ?p - package ?l - location)
    (at_vehicle ?v - vehicle ?l - location)
    (in ?p - package ?v - vehicle)
    (is_airport ?l - location)
    (loc_in_city ?l - location ?c - city)
  )

  (:action load_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_vehicle ?t ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in ?p ?t)
    )
  )

  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at_vehicle ?t ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in ?p ?t))
    )
  )

  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at_package ?p ?l)
      (at_vehicle ?a ?l)
    )
    :effect (and
      (not (at_package ?p ?l))
      (in ?p ?a)
    )
  )

  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at_vehicle ?a ?l)
    )
    :effect (and
      (at_package ?p ?l)
      (not (in ?p ?a))
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at_vehicle ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at_vehicle ?t ?from))
      (at_vehicle ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?c_from - city ?c_to - city)
    :precondition (and
      (at_vehicle ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
      (loc_in_city ?from ?c_from)
      (loc_in_city ?to ?c_to)
      (not (= ?c_from ?c_to))
    )
    :effect (and
      (not (at_vehicle ?a ?from))
      (at_vehicle ?a ?to)
    )
  )
)