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
  )

  ;; Truck actions for phase0 (initial local ground preparation)
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

  ;; Truck actions for phase2 (final local deliveries after flights)
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

  ;; Airplane actions for phase1 (inter-city movement)
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

  ;; Explicit phase advancement actions that enforce the required temporal ordering.
  ;; Advance from phase0 to phase1 only when the packages that must be flown are at their origin airports.
  (:action advance-to-phase1
    :parameters ()
    :precondition (and
      (current-phase phase0)
      ;; package_1 must be at its origin airport (location_0_0)
      (at-package package_1 location_0_0)
      ;; package_3 must be at its origin airport (location_1_0)
      (at-package package_3 location_1_0)
    )
    :effect (and
      (not (current-phase phase0))
      (current-phase phase1)
    )
  )

  ;; Advance from phase1 to phase2 only when the flown packages have been placed at their destination airports.
  (:action advance-to-phase2
    :parameters ()
    :precondition (and
      (current-phase phase1)
      ;; package_1 must have arrived at destination airport (location_1_0)
      (at-package package_1 location_1_0)
      ;; package_3 must have arrived at destination airport (location_0_0)
      (at-package package_3 location_0_0)
    )
    :effect (and
      (not (current-phase phase1))
      (current-phase phase2)
    )
  )
)