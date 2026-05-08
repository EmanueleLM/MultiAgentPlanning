(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location vehicle - object
    truck airplane - vehicle
    package
  )
  
  (:predicates
    (at ?v - vehicle ?l - location)
    (at ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (in_city ?l - location ?c - city)
    (is_airport ?l - location)
  )
  
  (:action load_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (at ?t ?l) (at ?p ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?t))
  )

  (:action unload_truck
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (not (in ?p ?t)) (at ?p ?l))
  )
  
  (:action load_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (at ?a ?l) (at ?p ?l) (is_airport ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?a))
  )

  (:action unload_airplane
    :parameters (?a - airplane ?p - package ?l - location)
    :precondition (and (in ?p ?a) (at ?a ?l) (is_airport ?l))
    :effect (and (not (in ?p ?a)) (at ?p ?l))
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