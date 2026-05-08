(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types package truck airplane location city)
  (:predicates
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?a - airplane)
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-truck ?t ?loc)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?loc)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at-package ?p ?loc)
      (at-airplane ?a ?loc)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-plane ?p ?a)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (in-plane ?p ?a)
      (at-airplane ?a ?loc)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-package ?p ?loc)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
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