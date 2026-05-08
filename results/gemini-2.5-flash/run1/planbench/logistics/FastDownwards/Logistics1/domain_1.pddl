(define (domain logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location - object
    package truck airplane - object
  )

  (:predicates
    (at ?obj - (package truck airplane) ?loc - location)
    (in ?pkg - package ?veh - (truck airplane))
    (in-city ?loc - location ?c - city)
    (is-airport ?loc - location)
  )

  (:action load_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?t ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?t)
    )
  )

  (:action unload_package_truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in ?p ?t)
      (at ?t ?l)
    )
    :effect (and
      (not (in ?p ?t))
      (at ?p ?l)
    )
  )

  (:action load_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at ?p ?l)
      (at ?a ?l)
    )
    :effect (and
      (not (at ?p ?l))
      (in ?p ?a)
    )
  )

  (:action unload_package_airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in ?p ?a)
      (at ?a ?l)
    )
    :effect (and
      (not (in ?p ?a))
      (at ?p ?l)
    )
  )

  (:action drive_truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (not (= ?from ?to))
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
      (is-airport ?from)
      (is-airport ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?a ?from))
      (at ?a ?to)
    )
  )
)