(define (domain jack_of_all_trades)
  (:requirements :typing :negative-preconditions :strips)
  (:types package truck airplane location city)

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (location-in-city ?l - location ?c - city)
    (airport ?l - location)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-truck ?p ?t)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?l)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?l)
    )
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (at-package ?p ?l)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (at-package ?p ?l))
      (in-airplane ?p ?a)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?l - location)
    :precondition (and
      (in-airplane ?p ?a)
      (at-airplane ?a ?l)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?l)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (location-in-city ?from ?c)
      (location-in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )
)