(define (domain logistics_instance_specific)
  (:requirements :strips :typing)

  (:types
    city
    location
    package
    vehicle
    truck airplane - vehicle
  )

  (:predicates
    (at ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (vehicle_at ?v - vehicle ?l - location)
    (in_city ?l - location ?c - city)
    (airport ?l - location)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (vehicle_at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (vehicle_at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (vehicle_at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (vehicle_at ?a ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (vehicle_at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
    )
    :effect (and
      (not (vehicle_at ?t ?from))
      (vehicle_at ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (vehicle_at ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (vehicle_at ?a ?from))
      (vehicle_at ?a ?to)
    )
  )
)