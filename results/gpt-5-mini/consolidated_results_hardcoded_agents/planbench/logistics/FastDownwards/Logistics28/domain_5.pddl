(define (domain multi_agent_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package phase)

  (:predicates
    (in-city ?l - location ?c - city)
    (airport ?l - location)

    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    (current-phase ?ph - phase)
    (phase-successor ?ph - phase ?next - phase)
  )

  ;; Truck actions in preparation phase (phase0)
  (:action truck-load-phase0
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (current-phase phase0)
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
      (in-city ?loc ?c)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
    )
  )

  (:action truck-unload-phase0
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (current-phase phase0)
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  (:action truck-drive-phase0
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (current-phase phase0)
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Truck actions in final phase (phase2)
  (:action truck-load-phase2
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (current-phase phase2)
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
      (in-city ?loc ?c)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
    )
  )

  (:action truck-unload-phase2
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (current-phase phase2)
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  (:action truck-drive-phase2
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (current-phase phase2)
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  ;; Airplane actions restricted to flight phase (phase1)
  (:action airplane-load-phase1
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (current-phase phase1)
      (at-airplane ?a ?loc)
      (at-package ?p ?loc)
      (airport ?loc)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-airplane ?p ?a)
    )
  )

  (:action airplane-unload-phase1
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (current-phase phase1)
      (at-airplane ?a ?loc)
      (in-airplane ?p ?a)
      (airport ?loc)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?loc)
    )
  )

  (:action airplane-fly-phase1
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (current-phase phase1)
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )

  ;; Phase advancement action using explicit successor relation.
  ;; Advance only when successor relation holds and required state conditions are met.
  (:action advance-phase
    :parameters (?from - phase ?to - phase)
    :precondition (and
      (current-phase ?from)
      (phase-successor ?from ?to)
      ;; No generic additional requirement here; specific domain constraints are enforced
      ;; by providing appropriate preconditions for the particular successor facts in the problem.
    )
    :effect (and
      (not (current-phase ?from))
      (current-phase ?to)
    )
  )
)