(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location vehicle - object
    truck airplane - vehicle
    package - object
  )
  (:predicates
    (at ?v - vehicle ?loc - location)
    (at ?p - package ?loc - location)
    (loaded ?p - package ?v - vehicle)
    (in_city ?loc - location ?city - city)
    (airport ?loc - location)
  )
  (:action load_package_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (at ?p ?loc) (at ?t ?loc))
    :effect (and (not (at ?p ?loc)) (loaded ?p ?t))
  )
  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (loaded ?p ?t) (at ?t ?loc))
    :effect (and (at ?p ?loc) (not (loaded ?p ?t)))
  )
  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (at ?p ?loc) (at ?a ?loc))
    :effect (and (not (at ?p ?loc)) (loaded ?p ?a))
  )
  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (loaded ?p ?a) (at ?a ?loc))
    :effect (and (at ?p ?loc) (not (loaded ?p ?a)))
  )
  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?city - city)
    :precondition (and (at ?t ?from) (in_city ?from ?city) (in_city ?to ?city))
    :effect (and (not (at ?t ?from)) (at ?t ?to))
  )
  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )
)