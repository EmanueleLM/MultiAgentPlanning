(define (domain logistics_city_transport)
  (:requirements :strips :typing)
  (:types 
    package truck airplane location city - object
  )

  (:predicates
    (at_package ?p - package ?l - location)
    (at_truck ?t - truck ?l - location)
    (at_airplane ?a - airplane ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (in_city ?l - location ?c - city)
    (is_airport ?l - location)
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and 
        (at_truck ?t ?from)
        (in_city ?from ?c)
        (in_city ?to ?c)
    )
    :effect (and 
        (not (at_truck ?t ?from))
        (at_truck ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and 
        (at_airplane ?a ?from)
        (is_airport ?from)
        (is_airport ?to)
    )
    :effect (and 
        (not (at_airplane ?a ?from))
        (at_airplane ?a ?to)
    )
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and 
        (at_package ?p ?l)
        (at_truck ?t ?l)
    )
    :effect (and 
        (not (at_package ?p ?l))
        (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and 
        (in_truck ?p ?t)
        (at_truck ?t ?l)
    )
    :effect (and 
        (not (in_truck ?p ?t))
        (at_package ?p ?l)
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and 
        (at_package ?p ?l)
        (at_airplane ?a ?l)
    )
    :effect (and 
        (not (at_package ?p ?l))
        (in_airplane ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and 
        (in_airplane ?p ?a)
        (at_airplane ?a ?l)
    )
    :effect (and 
        (not (in_airplane ?p ?a))
        (at_package ?p ?l)
    )
  )
)