(define (domain logistics39)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    vehicle
    truck - vehicle
    airplane - vehicle
    location
    city
  )
  (:predicates
    (at ?obj - (either package vehicle) ?l - location)
    (in ?p - package ?v - vehicle)
    (is_airport ?l - location)
    (in_city ?l - location ?c - city)
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
      (not (in ?p ?t))
      (at ?p ?l)
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
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
    :precondition (and
      (at ?t ?l_from)
      (in_city ?l_from ?c)
      (in_city ?l_to ?c)
      (not (= ?l_from ?l_to)) ; Truck must move to a different location
    )
    :effect (and
      (not (at ?t ?l_from))
      (at ?t ?l_to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?l_from - location ?l_to - location ?c_from - city ?c_to - city)
    :precondition (and
      (at ?a ?l_from)
      (is_airport ?l_from)
      (is_airport ?l_to)
      (in_city ?l_from ?c_from)
      (in_city ?l_to ?c_to)
      (not (= ?c_from ?c_to)) ; Airplane must fly between different cities
    )
    :effect (and
      (not (at ?a ?l_from))
      (at ?a ?l_to)
    )
  )
)