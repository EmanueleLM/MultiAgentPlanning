(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package
    truck
    airplane
    city
    location
    vehicle - (truck airplane)
  )

  (:predicates
    (at ?o - (package vehicle) ?l - location)
    (in ?p - package ?v - vehicle)
    (in_city ?l - location ?c - city)
    (is_airport ?l - location)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l)
                       (at ?t ?l))
    :effect (and (not (at ?p ?l))
                 (in ?p ?t))
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in ?p ?t)
                       (at ?t ?l))
    :effect (and (at ?p ?l)
                 (not (in ?p ?t)))
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l)
                       (at ?a ?l))
    :effect (and (not (at ?p ?l))
                 (in ?p ?a))
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in ?p ?a)
                       (at ?a ?l))
    :effect (and (at ?p ?l)
                 (not (in ?p ?a)))
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from)
                       (in_city ?from ?c)
                       (in_city ?to ?c))
    :effect (and (not (at ?t ?from))
                 (at ?t ?to))
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from)
                       (is_airport ?from)
                       (is_airport ?to))
    :effect (and (not (at ?a ?from))
                 (at ?a ?to))
  )
)