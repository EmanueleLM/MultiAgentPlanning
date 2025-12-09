(define (domain multi_agent_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package phase)

  (:predicates
    ;; topology
    (in-city ?l - location ?c - city)
    (airport ?l - location)

    ;; positions
    (at-truck ?t - truck ?l - location)
    (at-airplane ?a - airplane ?l - location)
    (at-package ?p - package ?l - location)

    ;; containment
    (in-truck ?p - package ?t - truck)
    (in-airplane ?p - package ?a - airplane)

    ;; phase ordering
    (current-phase ?ph - phase)
    (next-phase ?ph1 - phase ?ph2 - phase)
  )

  ;; -------------------------
  ;; Truck actions - intra-city loads, drives, and unloads.
  ;; Separated by phase so planner must follow explicit stage ordering.
  ;; -------------------------

  (:action truck-drive-phase0
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current-phase phase0)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  (:action truck-load-phase0
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
      (in-city ?loc ?c)
      (current-phase phase0)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
    )
  )

  (:action truck-unload-phase0
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (current-phase phase0)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  (:action truck-drive-phase2
    :parameters (?t - truck ?from - location ?to - location ?c - city)
    :precondition (and
      (at-truck ?t ?from)
      (in-city ?from ?c)
      (in-city ?to ?c)
      (current-phase phase2)
    )
    :effect (and
      (not (at-truck ?t ?from))
      (at-truck ?t ?to)
    )
  )

  (:action truck-load-phase2
    :parameters (?p - package ?t - truck ?loc - location ?c - city)
    :precondition (and
      (at-truck ?t ?loc)
      (at-package ?p ?loc)
      (in-city ?loc ?c)
      (current-phase phase2)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-truck ?p ?t)
    )
  )

  (:action truck-unload-phase2
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (current-phase phase2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  ;; -------------------------
  ;; Airplane actions - inter-city transfers restricted to phase1
  ;; -------------------------

  (:action airplane-load-phase1
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at-airplane ?a ?loc)
      (at-package ?p ?loc)
      (airport ?loc)
      (current-phase phase1)
    )
    :effect (and
      (not (at-package ?p ?loc))
      (in-airplane ?p ?a)
    )
  )

  (:action airplane-fly-phase1
    :parameters (?a - airplane ?from - location ?to - location)
    :precondition (and
      (at-airplane ?a ?from)
      (airport ?from)
      (airport ?to)
      (current-phase phase1)
    )
    :effect (and
      (not (at-airplane ?a ?from))
      (at-airplane ?a ?to)
    )
  )

  (:action airplane-unload-phase1
    :parameters (?p - package ?a - airplane ?loc - location)
    :precondition (and
      (at-airplane ?a ?loc)
      (in-airplane ?p ?a)
      (airport ?loc)
      (current-phase phase1)
    )
    :effect (and
      (not (in-airplane ?p ?a))
      (at-package ?p ?loc)
    )
  )

  ;; -------------------------
  ;; Phase advancement actions enforce ordering between phases using explicit package/location checks.
  ;; Advance from phase0 to phase1 only when the specified packages are physically at airports.
  ;; Advance from phase1 to phase2 only when the specified packages have been placed at destination airports.
  ;; -------------------------

  (:action advance-phase
    :parameters (?from - phase ?to - phase ?p1 - package ?l1 - location ?p2 - package ?l2 - location)
    :precondition (and
      (current-phase ?from)
      (next-phase ?from ?to)
      (at-package ?p1 ?l1)
      (airport ?l1)
      (at-package ?p2 ?l2)
      (airport ?l2)
    )
    :effect (and
      (not (current-phase ?from))
      (current-phase ?to)
    )
  )

)