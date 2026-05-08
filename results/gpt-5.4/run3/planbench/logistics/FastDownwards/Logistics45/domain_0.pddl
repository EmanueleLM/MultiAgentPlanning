(define (domain logistics_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    locatable
    package truck airplane - locatable
    location city
  )

  (:predicates
    (at ?x - locatable ?l - location)
    (in_truck ?p - package ?t - truck)
    (in_airplane ?p - package ?a - airplane)
    (airport ?l - location)
    (in_city ?l - location ?c - city)
  )

  (:action load_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
      (not (in_truck ?p ?t))
    )
    :effect (and
      (not (at ?p ?l))
      (in_truck ?p ?t)
    )
  )

  (:action unload_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in_truck ?p ?t)
      (at ?t ?l)
      (not (at ?p ?l))
    )
    :effect (and
      (not (in_truck ?p ?t))
      (at ?p ?l)
    )
  )

  (:action load_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
      (not (in_airplane ?p ?a))
    )
    :effect (and
      (not (at ?p ?l))
      (in_airplane ?p ?a)
    )
  )

  (:action unload_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in_airplane ?p ?a)
      (at ?a ?l)
      (not (at ?p ?l))
    )
    :effect (and
      (not (in_airplane ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in_city ?from ?c)
      (in_city ?to ?c)
      (not (at ?t ?to))
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action fly_airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at ?a ?from)
      (airport ?from)
      (airport ?to)
      (not (at ?a ?to))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)