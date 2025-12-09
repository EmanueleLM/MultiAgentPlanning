(define (domain multi_agent_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types city location truck airplane package phase)

  ;; Declare phase constants so domain-level references to phases are well-formed.
  (:constants phase0 phase1 phase2 - phase)

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

    ;; coordination / ordering
    (current-phase ?ph - phase)
    (ready-for-flight ?p - package)    ;; package is at an airport and prepared for airplane loading
    (arrived ?p - package)             ;; package was unloaded from airplane at destination airport
  )

  ;; -------------------------
  ;; Truck actions - intra-city loads, drives, and unloads.
  ;; Two versions: gated to phase0 (preparation) and phase2 (post-flight deliveries).
  ;; -------------------------

  (:action drive-truck-phase0
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

  (:action load-truck-phase0
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

  (:action unload-truck-at-airport-phase0
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (airport ?loc)
      (current-phase phase0)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
      (ready-for-flight ?p)
    )
  )

  (:action unload-truck-at-nonairport-phase0
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (not (airport ?loc))
      (current-phase phase0)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  ;; -------------------------
  ;; Airplane actions - only in phase1 (inter-city transfers)
  ;; -------------------------

  (:action load-airplane-phase1
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

  (:action unload-airplane-phase1
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
      (arrived ?p)
    )
  )

  (:action fly-airplane-phase1
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

  ;; -------------------------
  ;; Truck actions for post-flight deliveries (phase2)
  ;; -------------------------

  (:action drive-truck-phase2
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

  (:action load-truck-phase2
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

  (:action unload-truck-at-airport-phase2
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (airport ?loc)
      (current-phase phase2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
      (ready-for-flight ?p)
    )
  )

  (:action unload-truck-at-nonairport-phase2
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
      (at-truck ?t ?loc)
      (in-truck ?p ?t)
      (not (airport ?loc))
      (current-phase phase2)
    )
    :effect (and
      (not (in-truck ?p ?t))
      (at-package ?p ?loc)
    )
  )

  ;; -------------------------
  ;; Phase advancement actions enforce ordering between phases.
  ;; These actions are explicit and require concrete package readiness/arrival
  ;; to prevent airplane actions from executing before trucks have prepared packages,
  ;; and to prevent post-flight truck deliveries before airplane arrivals.
  ;; -------------------------

  (:action advance-phase0-to-1
    :parameters (?pA - package ?pB - package)
    :precondition (and
      (current-phase phase0)
      ;; require both specified packages to be at airports and flagged ready-for-flight,
      ;; ensuring trucks have placed inter-city packages at airports.
      (ready-for-flight ?pA)
      (ready-for-flight ?pB)
    )
    :effect (and
      (not (current-phase phase0))
      (current-phase phase1)
    )
  )

  (:action advance-phase1-to-2
    :parameters (?pA - package ?pB - package)
    :precondition (and
      (current-phase phase1)
      ;; require both specified packages to have arrived at destination airports
      (arrived ?pA)
      (arrived ?pB)
    )
    :effect (and
      (not (current-phase phase1))
      (current-phase phase2)
    )
  )

)