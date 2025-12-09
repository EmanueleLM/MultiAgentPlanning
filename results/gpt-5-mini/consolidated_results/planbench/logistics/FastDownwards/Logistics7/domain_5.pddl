(define (domain logistics7)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck airplane package location city step)
  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)
    (in-city ?l - location ?c - city)
    (airport ?l - location)
    (succ ?s - step ?s2 - step)
    (at-step ?s - step)
  )

  (:action load-truck
    :parameters (?p - package ?t - truck ?loc - location ?s - step ?s2 - step)
    :precondition (and
      (at-package ?p ?loc)
      (at-truck ?t ?loc)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action unload-truck
    :parameters (?p - package ?t - truck ?loc - location ?s - step ?s2 - step)
    :precondition (and
      (in-truck ?p ?t)
      (at-truck ?t ?loc)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action load-airplane
    :parameters (?p - package ?a - airplane ?loc - location ?s - step ?s2 - step)
    :precondition (and
      (at-package ?p ?loc)
      (at-airplane ?a ?loc)
      (airport ?loc)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-airplane ?p ?a)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action unload-airplane
    :parameters (?p - package ?a - airplane ?loc - location ?s - step ?s2 - step)
    :precondition (and
      (in-airplane ?p ?a)
      (at-airplane ?a ?loc)
      (airport ?loc)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?loc)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action drive-truck
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s - step ?s2 - step)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action fly-airplane
    :parameters (?a - airplane ?from - location ?to - location ?s - step ?s2 - step)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (at-step ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)