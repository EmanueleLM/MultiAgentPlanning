(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package)
  (:predicates
    (in_city ?loc - location ?c - city)
    (airport ?loc - location)
    (at_package ?p - package ?loc - location)
    (at_truck ?t - truck ?loc - location)
    (at_airplane ?a - airplane ?loc - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (at_package ?p ?loc) (at_truck ?t ?loc))
    :effect (and (not (at_package ?p ?loc)) (in_truck ?p ?t))
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and (in_truck ?p ?t) (at_truck ?t ?loc))
    :effect (and (not (in_truck ?p ?t)) (at_package ?p ?loc))
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (at_package ?p ?loc) (at_airplane ?a ?loc))
    :effect (and (not (at_package ?p ?loc)) (in_airplane ?p ?a))
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and (in_airplane ?p ?a) (at_airplane ?a ?loc))
    :effect (and (not (in_airplane ?p ?a)) (at_package ?p ?loc))
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and (at_truck ?t ?from) (in_city ?from ?c) (in_city ?to ?c))
    :effect (and (not (at_truck ?t ?from)) (at_truck ?t ?to))
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and (at_airplane ?a ?from) (airport ?from) (airport ?to))
    :effect (and (not (at_airplane ?a ?from)) (at_airplane ?a ?to))
  )
)