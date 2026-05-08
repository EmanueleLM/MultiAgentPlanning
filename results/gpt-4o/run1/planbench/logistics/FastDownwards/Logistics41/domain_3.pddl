(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
    city
    location
    vehicle - object
    truck - vehicle
    airplane - vehicle
    package
  )
  (:predicates
    (at ?v - vehicle ?l - location)
    (at ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )
  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?t ?l) (at ?p ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?t))
  )
  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t) (at ?t ?l))
    :effect (and (not (in ?p ?t)) (at ?p ?l))
  )
  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?a ?l) (at ?p ?l))
    :effect (and (not (at ?p ?l)) (in ?p ?a))
  )
  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a) (at ?a ?l))
    :effect (and (not (in ?p ?a)) (at ?p ?l))
  )
  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in-city ?from ?c) (in-city ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)