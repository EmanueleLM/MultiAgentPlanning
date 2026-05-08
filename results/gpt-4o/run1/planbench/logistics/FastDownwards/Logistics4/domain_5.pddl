(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location vehicle truck airplane package)
  (:predicates
    (at ?v - vehicle ?l - location)
    (at ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (connected_within_city ?l1 ?l2 - location ?c - city)
    (airport ?l - location)
    (in_city ?l - location ?c - city)
  )

  (:action load_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l))
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t))
  )

  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l))
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l))
  )

  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l))
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a))
  )

  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l))
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l))
  )

  (:action drive_truck
    :parameters (?t - truck ?l1 ?l2 - location ?c - city)
    :precondition (and
      (at ?t ?l1)
      (connected_within_city ?l1 ?l2 ?c))
    :effect (and
      (not (at ?t ?l1))
      (at ?t ?l2))
  )

  (:action fly_airplane
    :parameters (?a - airplane ?l1 ?l2 - location ?c1 ?c2 - city)
    :precondition (and
      (at ?a ?l1)
      (airport ?l1)
      (airport ?l2))
    :effect (and
      (not (at ?a ?l1))
      (at ?a ?l2))
  )
)