(define (domain logistics_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    truck
    plane
    package
    location
    city
    stage
  )

  (:predicates
    (at-truck ?t - truck ?l - location)
    (at-plane ?pl - plane ?l - location)

    (at-pkg ?p - package ?l - location)
    (in-truck ?p - package ?t - truck)
    (in-plane ?p - package ?pl - plane)

    (is-airport ?l - location)
    (in-city ?l - location ?c - city)

    (cur-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action truck_load
    :parameters (?t - truck ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (at-pkg ?p ?l)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in-truck ?p ?t)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-truck ?t ?l)
      (in-truck ?p ?t)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-pkg ?p ?l)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action plane_fly
    :parameters (?pl - plane ?from - location ?to - location ?cf - city ?ct - city ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
      (in-city ?from ?cf)
      (in-city ?to ?ct)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-plane ?pl ?from))
      (at-plane ?pl ?to)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action plane_load
    :parameters (?pl - plane ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?l)
      (is-airport ?l)
      (at-pkg ?p ?l)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (at-pkg ?p ?l))
      (in-plane ?p ?pl)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )

  (:action plane_unload
    :parameters (?pl - plane ?p - package ?l - location ?s1 - stage ?s2 - stage)
    :precondition (and
      (at-plane ?pl ?l)
      (is-airport ?l)
      (in-plane ?p ?pl)
      (cur-stage ?s1)
      (next ?s1 ?s2)
    )
    :effect (and
      (not (in-plane ?p ?pl))
      (at-pkg ?p ?l)
      (not (cur-stage ?s1))
      (cur-stage ?s2)
    )
  )
)