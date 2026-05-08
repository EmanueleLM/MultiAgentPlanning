(define (domain transport_domain)
  (:requirements :strips :typing)
  (:types
    entity
    vehicle - entity
    truck airplane - vehicle
    package - entity
    location
    city
  )

  (:predicates
    ;; an entity (truck, airplane, or package) is at a location
    (at ?e - entity ?l - location)
    ;; a package is loaded in a vehicle (truck or airplane)
    (in ?p - package ?v - vehicle)
    ;; location to city membership
    (loc_in_city ?l - location ?c - city)
    ;; location is an airport
    (is_airport ?l - location)
  )

  ;; Truck actions (operate only within a single city)
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (loc_in_city ?from ?c)
      (loc_in_city ?to ?c)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action load_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (at ?p ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
      (at ?t ?l)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  ;; Airplane actions (only between airport locations)
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (is_airport ?from)
      (is_airport ?to)
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )

  (:action load_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (at ?p ?l)
      (is_airport ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and
      (at ?a ?l)
      (in ?p ?a)
      (is_airport ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )
)