(define (domain logistics-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    package location city vehicle
    truck plane - vehicle
  )

  (:predicates
    (at-package ?p - package ?l - location)
    (in ?p - package ?v - vehicle)
    (at-vehicle ?v - vehicle ?l - location)
    (is-airport ?l - location)
    (in-city ?l - location ?c - city)
  )

  (:action truck_load
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at-vehicle ?t ?loc)
      (at-package ?p ?loc)
    )
    :effect (and
      (in ?p ?t)
      (not (at-package ?p ?loc))
    )
  )

  (:action truck_unload
    :parameters (?t - truck ?p - package ?loc - location)
    :precondition (and
      (at-vehicle ?t ?loc)
      (in ?p ?t)
    )
    :effect (and
      (not (in ?p ?t))
      (at-package ?p ?loc)
    )
  )

  (:action truck_drive
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-vehicle ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-vehicle ?t ?from))
      (at-vehicle ?t ?to)
    )
  )

  (:action plane_load
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and
      (at-vehicle ?pl ?loc)
      (at-package ?p ?loc)
      (is-airport ?loc)
    )
    :effect (and
      (in ?p ?pl)
      (not (at-package ?p ?loc))
    )
  )

  (:action plane_unload
    :parameters (?pl - plane ?p - package ?loc - location)
    :precondition (and
      (at-vehicle ?pl ?loc)
      (in ?p ?pl)
      (is-airport ?loc)
    )
    :effect (and
      (not (in ?p ?pl))
      (at-package ?p ?loc)
    )
  )

  (:action plane_fly
    :parameters (?pl - plane ?from - location ?to - location)
    :precondition (and
      (at-vehicle ?pl ?from)
      (is-airport ?from)
      (is-airport ?to)
    )
    :effect (and
      (not (at-vehicle ?pl ?from))
      (at-vehicle ?pl ?to)
    )
  )
)