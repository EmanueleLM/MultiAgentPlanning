(define (domain logistics)
  (:requirements :strips :typing)
  (:types
    city location locatable - object
    package vehicle - locatable
    truck airplane - vehicle
  )
  (:predicates
    (at ?obj - locatable ?loc - location)
    (in_vehicle ?pkg - package ?veh - vehicle)
    (in_city ?loc - location ?city - city)
    (is_airport ?loc - location)
  )
  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (not (at ?p ?l)) (in_vehicle ?p ?t))
  )
  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in_vehicle ?p ?t) (at ?t ?l))
    :effect (and (not (in_vehicle ?p ?t)) (at ?p ?l))
  )
  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?a ?l))
    :effect (and (not (at ?p ?l)) (in_vehicle ?p ?a))
  )
  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in_vehicle ?p ?a) (at ?a ?l))
    :effect (and (not (in_vehicle ?p ?a)) (at ?p ?l))
  )
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (is_airport ?from) (is_airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)