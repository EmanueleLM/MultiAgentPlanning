(define (domain logistics_city_transport)
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
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?t))
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?a ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?a))
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (not (in ?p ?t)) (at ?p ?l))
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at ?a ?l))
    :effect (and (not (in ?p ?a)) (at ?p ?l))
  )

  (:action drive_truck
    :parameters (?t - truck ?l_from - location ?l_to - location ?c - city)
    :precondition (and (at ?t ?l_from) (in_city ?l_from ?c) (in_city ?l_to ?c))
    :effect (and (not (at ?t ?l_from)) (at ?t ?l_to))
  )

  (:action fly_airplane
    :parameters (?a - airplane ?l_from - location ?l_to - location)
    :precondition (and (at ?a ?l_from) (is_airport ?l_from) (is_airport ?l_to))
    :effect (and (not (at ?a ?l_from)) (at ?a ?l_to))
  )
)