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

    ;; coordination / ordering
    (current-phase ?ph - phase)
    (ready-for-flight ?p - package)    ;; package is at an airport and prepared for airplane loading
    (local-delivered ?p - package)     ;; package was delivered to a non-airport local goal (phase0)
    (arrived ?p - package)             ;; package was unloaded from airplane at destination airport (phase1)
  )

  ;; -------------------------
  ;; Truck actions allowed in phase0 (preparation) - intra-city moves, loads, and unloads
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

  ;; Unload at an airport during phase0 marks the package ready-for-flight.
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

  ;; Unload at a non-airport during phase0 marks a local delivery (local-delivered).
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
      (local-delivered ?p)
    )
  )

  ;; -------------------------
  ;; Airplane actions allowed only in phase1 (inter-city transfers)
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
  ;; Truck actions allowed in phase2 (post-flight local deliveries)
  ;; These are duplicates of phase0 truck actions but gated to phase2 to enforce ordering.
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
  ;; Phase advancement actions enforce the required ordering constraints.
  ;; Advance from phase0 -> phase1 only allowed when preparation goals are satisfied:
  ;;   - packages that must be at airports are ready-for-flight,
  ;;   - packages that must be locally delivered in phase0 are marked local-delivered.
  ;; This prevents airplane actions from executing before trucks have prepared packages.
  ;; -------------------------

  (:action advance-phase0-to-1
    :parameters (?ph0 - phase ?ph1 - phase ?pp0 - package ?pp1 - package ?pp2 - package ?pp3 - package)
    :precondition (and
      (current-phase ?ph0)
      ;; require that the local package (package_0 in the problem) has been delivered locally
      (local-delivered ?pp0)
      ;; require that the packages that must be at airports are ready for airplane loading
      (ready-for-flight ?pp1)
      (ready-for-flight ?pp2)
      (ready-for-flight ?pp3)
    )
    :effect (and
      (not (current-phase ?ph0))
      (current-phase ?ph1)
    )
  )

  ;; Advance from phase1 -> phase2 only allowed when airplane transfers have arrived at destination airports.
  (:action advance-phase1-to-2
    :parameters (?ph1 - phase ?ph2 - phase ?pa - package ?pb - package)
    :precondition (and
      (current-phase ?ph1)
      (arrived ?pa)
      (arrived ?pb)
    )
    :effect (and
      (not (current-phase ?ph1))
      (current-phase ?ph2)
    )
  )

)