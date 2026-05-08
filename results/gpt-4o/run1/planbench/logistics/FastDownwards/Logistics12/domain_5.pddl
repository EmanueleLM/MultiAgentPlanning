(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    vehicle
    truck - vehicle
    airplane - vehicle
    location
    city_location - location
    airport_location - location
    package
    city
  )
  (:predicates
    (at ?v - vehicle ?l - location)
    (at ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (airport ?l - location)
    (in_city ?l - city_location ?c - city)
    (connected_within_city ?from - city_location ?to - city_location ?c - city)
    (connected_between_airports ?from - airport_location ?to - airport_location)
  )
  
  (:action load-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?t))
  )
  
  (:action unload-package-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (not (in ?p ?t)) (at ?p ?l))
  )
  
  (:action load-package-airplane
    :parameters (?p - package ?a - airplane ?l - airport_location)
    :precondition (and (at ?p ?l) (at ?a ?l) (airport ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?a))
  )
  
  (:action unload-package-airplane
    :parameters (?p - package ?a - airplane ?l - airport_location)
    :precondition (and (in ?p ?a) (at ?a ?l) (airport ?l))
    :effect (and (not (in ?p ?a)) (at ?p ?l))
  )
  
  (:action drive-truck
    :parameters (?t - truck ?from - city_location ?to - city_location ?c - city)
    :precondition (and (at ?t ?from) (in_city ?from ?c) (in_city ?to ?c) (connected_within_city ?from ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  
  (:action fly-airplane
    :parameters (?a - airplane ?from - airport_location ?to - airport_location)
    :precondition (and (at ?a ?from) (connected_between_airports ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)