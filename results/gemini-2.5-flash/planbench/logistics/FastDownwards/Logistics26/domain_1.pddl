(define (domain logistics26)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package truck airplane - vehicle
    location city - object
    vehicle - object
  )

  (:predicates
    (at-location ?obj - (package truck airplane) ?loc - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (in-city ?loc - location ?c - city)
    (is-airport ?loc - location)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-location ?p ?l)
      (at-location ?t ?l)
    )
    :effect (and
      (not (at-location ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-location ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-location ?p ?l)
    )
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at-location ?p ?l)
      (at-location ?a ?l)
    )
    :effect (and
      (not (at-location ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at-location ?a ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-location ?p ?l)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?l-from - location ?l-to - location ?c - city)
    :precondition (and
      (at-location ?t ?l-from)
      (in-city ?l-from ?c)
      (in-city ?l-to ?c)
      (not (= ?l-from ?l-to))
    )
    :effect (and
      (not (at-location ?t ?l-from))
      (at-location ?t ?l-to)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?l-from - location ?l-to - location ?c-from - city ?c-to - city)
    :precondition (and
      (at-location ?a ?l-from)
      (is-airport ?l-from)
      (is-airport ?l-to)
      (in-city ?l-from ?c-from)
      (in-city ?l-to ?c-to)
      (not (= ?c-from ?c-to))
      (not (= ?l-from ?l-to))
    )
    :effect (and
      (not (at-location ?a ?l-from))
      (at-location ?a ?l-to)
    )
  )
)