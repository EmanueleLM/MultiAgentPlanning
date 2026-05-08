(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location city - object
    vehicle - object
    truck airplane - vehicle
    package - object
  )
  (:predicates
    (at ?v - vehicle ?l - location)
    (in-city ?l - location ?c - city)
    (is-airport ?l - location)
    (in ?p - package ?v - vehicle)
    (at-location ?p - package ?l - location)
  )
  
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?t ?l) (at-location ?p ?l))
    :effect (and (not (at-location ?p ?l)) (in ?p ?t))
  )
  
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?t ?l) (in ?p ?t))
    :effect (and (not (in ?p ?t)) (at-location ?p ?l))
  )
  
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?a ?l) (at-location ?p ?l))
    :effect (and (not (at-location ?p ?l)) (in ?p ?a))
  )
  
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?a ?l) (in ?p ?a))
    :effect (and (not (in ?p ?a)) (at-location ?p ?l))
  )
  
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?t ?from) (in-city ?from ?city) (in-city ?to ?city))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (is-airport ?from) (is-airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)