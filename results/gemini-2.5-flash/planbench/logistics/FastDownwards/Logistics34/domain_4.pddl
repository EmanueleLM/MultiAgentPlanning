(define (domain logistics34)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    location
    vehicle
    airplane - vehicle
    truck - vehicle
    city
  )

  (:predicates
    (package_at ?p - package ?l - location)
    (vehicle_at ?v - vehicle ?l - location)
    (in ?pkg - package ?veh - vehicle)
    (loc_is_city ?loc - location ?city - city)
    (is_airport ?loc - location)
  )

  (:action load_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition
      (and
        (package_at ?p ?l)
        (vehicle_at ?t ?l)
      )
    :effect
      (and
        (not (package_at ?p ?l))
        (in ?p ?t)
      )
  )

  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition
      (and
        (in ?p ?t)
        (vehicle_at ?t ?l)
      )
    :effect
      (and
        (not (in ?p ?t))
        (package_at ?p ?l)
      )
  )

  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition
      (and
        (package_at ?p ?l)
        (vehicle_at ?a ?l)
      )
    :effect
      (and
        (not (package_at ?p ?l))
        (in ?p ?a)
      )
  )

  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition
      (and
        (in ?p ?a)
        (vehicle_at ?a ?l)
      )
    :effect
      (and
        (not (in ?p ?a))
        (package_at ?p ?l)
      )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition
      (and
        (vehicle_at ?t ?from)
        (loc_is_city ?from ?c)
        (loc_is_city ?to ?c)
        (not (= ?from ?to))
      )
    :effect
      (and
        (not (vehicle_at ?t ?from))
        (vehicle_at ?t ?to)
      )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location ?from_city - city ?to_city - city)
    :precondition
      (and
        (vehicle_at ?a ?from)
        (is_airport ?from)
        (is_airport ?to)
        (loc_is_city ?from ?from_city)
        (loc_is_city ?to ?to_city)
        (not (= ?from ?to))
        (not (= ?from_city ?to_city))
      )
    :effect
      (and
        (not (vehicle_at ?a ?from))
        (vehicle_at ?a ?to)
      )
  )
)