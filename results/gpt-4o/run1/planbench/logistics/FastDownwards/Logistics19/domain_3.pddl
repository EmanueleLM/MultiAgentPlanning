(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types location vehicle truck airplane package)
  (:predicates
    (at ?v - vehicle ?l - location)
    (at_package ?p - package ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (airport ?l - location)
    (city_location ?l - location ?c - object)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at_package ?p ?l) (at ?t ?l))
    :effect (and (not (at_package ?p ?l)) (in_truck ?p ?t))
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in_truck ?p ?t) (at ?t ?l))
    :effect (and (not (in_truck ?p ?t)) (at_package ?p ?l))
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at_package ?p ?l) (at ?a ?l) (airport ?l))
    :effect (and (not (at_package ?p ?l)) (in_airplane ?p ?a))
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in_airplane ?p ?a) (at ?a ?l) (airport ?l))
    :effect (and (not (in_airplane ?p ?a)) (at_package ?p ?l))
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - object)
    :precondition (and (at ?t ?from) (city_location ?from ?c) (city_location ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)