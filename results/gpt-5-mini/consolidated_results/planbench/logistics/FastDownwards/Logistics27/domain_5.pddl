(define (domain transport_domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck airplane package location city stage
  )

  (:predicates
    (at-truck ?tr - truck ?loc - location)
    (at-plane ?pl - airplane ?loc - location)
    (at-package ?pkg - package ?loc - location)
    (in-truck ?pkg - package ?tr - truck)
    (in-plane ?pkg - package ?pl - airplane)

    (in-city ?loc - location ?c - city)
    (is-airport ?loc - location)
    (air-route ?from - location ?to - location)

    (next ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)
  )

  (:action truck-load
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?loc)
      (at-package ?pkg ?loc)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in-truck ?pkg ?tr)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action truck-unload
    :parameters (?tr - truck ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?loc)
      (in-truck ?pkg ?tr)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (at-package ?pkg ?loc)
      (not (in-truck ?pkg ?tr))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action drive-truck
    :parameters (?tr - truck ?from - location ?to - location ?c - city ?s - stage ?s2 - stage)
    :precondition (and
      (at-truck ?tr ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action plane-load
    :parameters (?pl - airplane ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?loc)
      (at-package ?pkg ?loc)
      (is-airport ?loc)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-package ?pkg ?loc))
      (in-plane ?pkg ?pl)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action plane-unload
    :parameters (?pl - airplane ?pkg - package ?loc - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?loc)
      (in-plane ?pkg ?pl)
      (is-airport ?loc)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (at-package ?pkg ?loc)
      (not (in-plane ?pkg ?pl))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action fly-plane
    :parameters (?pl - airplane ?from - location ?to - location ?s - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
      (air-route ?from ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (at-plane ?pl ?from))
      (at-plane ?pl ?to)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)