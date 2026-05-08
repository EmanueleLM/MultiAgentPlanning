(define (domain city_logistics)
  (:requirements :strips :typing)
  (:types
    city
    location
    airport - location
    vehicle
    truck airplane - vehicle
    package
  )

  (:predicates
    (at ?v - vehicle ?l - location)
    (at_package ?p - package ?l - location)
    (loaded_in ?p - package ?v - vehicle)
    (in_city ?l - location ?c - city)
    (truck_assigned_to_city ?t - truck ?c - city)
    (air_route ?from - airport ?to - airport)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?t ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (loaded_in ?p ?t)
      (not (at_package ?p ?l))
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (loaded_in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (loaded_in ?p ?t))
      (at_package ?p ?l)
    )
  )

  (:action load_plane
    :parameters (?p - package ?a - airplane ?l - airport)
    :precondition (and
      (at ?a ?l)
      (at_package ?p ?l)
    )
    :effect (and
      (loaded_in ?p ?a)
      (not (at_package ?p ?l))
    )
  )

  (:action unload_plane
    :parameters (?p - package ?a - airplane ?l - airport)
    :precondition (and
      (loaded_in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (loaded_in ?p ?a))
      (at_package ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (truck_assigned_to_city ?t ?c)
    )
    :effect (and
      (at ?t ?to)
      (not (at ?t ?from))
    )
  )

  (:action fly_plane
    :parameters (?a - airplane ?from - airport ?to - airport)
    :precondition (and
      (at ?a ?from)
      (air_route ?from ?to)
    )
    :effect (and
      (at ?a ?to)
      (not (at ?a ?from))
    )
  )
)