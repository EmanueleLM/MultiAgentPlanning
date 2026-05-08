(define (domain logistics_35)
  (:requirements :strips :typing)
  (:types
    city location thing - object
    package vehicle - thing
    truck airplane - vehicle
  )
  (:predicates
    (at ?t - thing ?l - location)
    (in_vehicle ?p - package ?v - vehicle)
    (in_city ?l - location ?c - city)
    (airport ?l - location)
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
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)