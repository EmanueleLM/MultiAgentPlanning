(define (domain logistics_47)
  (:requirements :strips :typing)
  (:types
    city location locatable - object
    package vehicle - locatable
    truck airplane - vehicle
  )
  (:predicates
    (at ?obj - locatable ?loc - location)
    (in ?pkg - package ?veh - vehicle)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
  )

  (:action load_truck
    :parameters (?p - package ?v - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?v ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?v))
  )

  (:action load_airplane
    :parameters (?p - package ?v - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?v ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?v))
  )

  (:action unload_truck
    :parameters (?p - package ?v - truck ?l - location)
    :precondition (and (in ?p ?v) (at ?v ?l))
    :effect (and (not (in ?p ?v)) (at ?p ?l))
  )

  (:action unload_airplane
    :parameters (?p - package ?v - airplane ?l - location)
    :precondition (and (in ?p ?v) (at ?v ?l))
    :effect (and (not (in ?p ?v)) (at ?p ?l))
  )

  (:action drive_truck
    :parameters (?v - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?v ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (not (at ?v ?from)) (at ?v ?to))
  )

  (:action fly_airplane
    :parameters (?v - airplane ?from - location ?to - location)
    :precondition (and (at ?v ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (not (at ?v ?from)) (at ?v ?to))
  )
)