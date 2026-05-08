(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types location city vehicle - object truck airplane - vehicle package - object)
  (:predicates
    (at ?v - vehicle ?loc - location)
    (at_package ?p - package ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (airport ?loc - location)
    (in_city ?loc - location ?c - city)
  )
  
  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (at_package ?p ?loc) (at ?t ?loc))
    :effect (and (not (at_package ?p ?loc)) (in_truck ?p ?t))
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in_truck ?p ?t) (at ?t ?loc))
    :effect (and (not (in_truck ?p ?t)) (at_package ?p ?loc))
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (at_package ?p ?loc) (at ?a ?loc) (airport ?loc))
    :effect (and (not (at_package ?p ?loc)) (in_airplane ?p ?a))
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (in_airplane ?p ?a) (at ?a ?loc) (airport ?loc))
    :effect (and (not (in_airplane ?p ?a)) (at_package ?p ?loc))
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at ?t ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)