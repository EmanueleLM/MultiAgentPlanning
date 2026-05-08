(define (domain logistics)
  (:requirements :strips :typing)
  (:types
    package truck airplane location city - object
  )
  (:predicates
    (at ?obj - object ?loc - location)
    (in_truck ?pkg - package ?truck - truck)
    (in_airplane ?pkg - package ?airplane - airplane)
    (in_city ?loc - location ?city - city)
    (airport ?loc - location)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (at ?p ?l) (at ?t ?l))
    :effect (and (not (at ?p ?l)) (in_truck ?p ?t))
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and (in_truck ?p ?t) (at ?t ?l))
    :effect (and (at ?p ?l) (not (in_truck ?p ?t)))
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (at ?p ?l) (at ?a ?l))
    :effect (and (not (at ?p ?l)) (in_airplane ?p ?a))
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and (in_airplane ?p ?a) (at ?a ?l))
    :effect (and (at ?p ?l) (not (in_airplane ?p ?a)))
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