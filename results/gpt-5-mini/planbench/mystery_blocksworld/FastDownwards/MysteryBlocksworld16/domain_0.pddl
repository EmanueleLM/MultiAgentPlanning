(define (domain multi_agent_phased_delivery)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent package loc phase)

  (:predicates
    ;; agent and package locations
    (at-agent ?a - agent ?l - loc)
    (at-package ?p - package ?l - loc)

    ;; role markers to ensure only designated agent performs role-specific actions
    (is-auditor ?a - agent)
    (is-loader ?a - agent)
    (is-transporter ?a - agent)
    (is-orchestrator ?a - agent)

    ;; package state predicates
    (inspected ?p - package)
    (loaded ?p - package)
    (in-transporter ?p - package)
    (unloaded ?p - package)

    ;; phase control
    (current-phase ?ph - phase)
    (phase-succ ?ph1 - phase ?ph2 - phase)
  )

  ;; Auditor inspects the package only during phase1 and only at the package location.
  (:action auditor_inspect
    :parameters (?aud - agent ?p - package ?loc - loc)
    :precondition (and
      (is-auditor ?aud)
      (at-agent ?aud ?loc)
      (at-package ?p ?loc)
      (current-phase phase1)
      (not (inspected ?p))
    )
    :effect (and
      (inspected ?p)
    )
  )

  ;; Orchestrator advances from phase1 to phase2 only after inspection (enforce contiguity via phase-succ).
  (:action orchestrator_advance_p1_to_p2
    :parameters (?org - agent)
    :precondition (and
      (is-orchestrator ?org)
      (current-phase phase1)
      (phase-succ phase1 phase2)
      ;; require that the package(s) to be moved have been inspected
      ;; This action is intentionally generic (no package param) but will be applicable only
      ;; when at least one inspected package exists. To avoid skipping, the usual intended package is inspected.
      ;; If multiple packages exist, additional domain/problem constraints would be required to pin them down.
      (exists (?p - package) (inspected ?p))
    )
    :effect (and
      (not (current-phase phase1))
      (current-phase phase2)
    )
  )

  ;; Loader loads a package onto the transporter during phase2.
  (:action loader_load
    :parameters (?ldr - agent ?tr - agent ?p - package ?loc - loc)
    :precondition (and
      (is-loader ?ldr)
      (is-transporter ?tr)
      (at-agent ?ldr ?loc)
      (at-agent ?tr ?loc)
      (at-package ?p ?loc)
      (current-phase phase2)
      (inspected ?p)
      (not (loaded ?p))
    )
    :effect (and
      (loaded ?p)
      (in-transporter ?p)
      (not (at-package ?p ?loc))
    )
  )

  ;; Orchestrator advances from phase2 to phase3 only after loading (enforce contiguity via phase-succ).
  (:action orchestrator_advance_p2_to_p3
    :parameters (?org - agent)
    :precondition (and
      (is-orchestrator ?org)
      (current-phase phase2)
      (phase-succ phase2 phase3)
      (exists (?p - package) (loaded ?p))
    )
    :effect (and
      (not (current-phase phase2))
      (current-phase phase3)
    )
  )

  ;; Transporter moves (carrying the package) during phase3. Moving is allowed between any locs
  ;; (no explicit connectivity data was provided).
  (:action transporter_move
    :parameters (?tr - agent ?from - loc ?to - loc ?p - package)
    :precondition (and
      (is-transporter ?tr)
      (at-agent ?tr ?from)
      (current-phase phase3)
      (in-transporter ?p)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-agent ?tr ?from))
      (at-agent ?tr ?to)
      ;; package remains in-transporter while moving; its at-package is absent until unload
    )
  )

  ;; Transporter unloads the package at the destination during phase3.
  (:action transporter_unload
    :parameters (?tr - agent ?p - package ?loc - loc)
    :precondition (and
      (is-transporter ?tr)
      (at-agent ?tr ?loc)
      (current-phase phase3)
      (in-transporter ?p)
      (loaded ?p)
    )
    :effect (and
      (not (in-transporter ?p))
      (not (loaded ?p))
      (at-package ?p ?loc)
      (unloaded ?p)
    )
  )

  ;; Optional movement for loader (allows loader to reposition when needed).
  (:action loader_move
    :parameters (?ldr - agent ?from - loc ?to - loc)
    :precondition (and
      (is-loader ?ldr)
      (at-agent ?ldr ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-agent ?ldr ?from))
      (at-agent ?ldr ?to)
    )
  )

  ;; Optional movement for auditor (allows auditor to reposition when needed).
  (:action auditor_move
    :parameters (?aud - agent ?from - loc ?to - loc)
    :precondition (and
      (is-auditor ?aud)
      (at-agent ?aud ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at-agent ?aud ?from))
      (at-agent ?aud ?to)
    )
  )
)