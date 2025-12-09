(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    city location time package truck airplane
  )

  (:predicates
    (at-truck ?tr - truck ?loc - location)
    (at-plane ?a - airplane ?loc - location)

    (at-pkg ?p - package ?loc - location)
    (in-truck ?p - package ?tr - truck)
    (in-plane ?p - package ?a - airplane)

    (airport ?loc - location)
    (in-city ?loc - location ?c - city)

    (stage ?s - time)
    (succ ?s1 - time ?s2 - time)
    (current-stage ?s - time)
  )

  (:action truck-load
    :parameters (?tr - truck ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-pkg ?p ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-pkg ?p ?loc))
      (in-truck ?p ?tr)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-truck ?p ?tr)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-truck ?p ?tr))
      (at-pkg ?p ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action truck-drive
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - time ?s2 - time)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action plane-load
    :parameters (?a - airplane ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?loc)
      (at-pkg ?p ?loc)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-pkg ?p ?loc))
      (in-plane ?p ?a)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action plane-unload
    :parameters (?a - airplane ?p - package ?loc - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?loc)
      (in-plane ?p ?a)
      (airport ?loc)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (in-plane ?p ?a))
      (at-pkg ?p ?loc)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action plane-fly
    :parameters (?a - airplane ?from - location ?to - location ?s - time ?s2 - time)
    :precondition (and
      (at-plane ?a ?from)
      (airport ?from)
      (airport ?to)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (at-plane ?a ?from))
      (at-plane ?a ?to)
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)