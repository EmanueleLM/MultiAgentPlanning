(define (domain model-integration)
  ; Domain for a strict, phase-ordered integration workflow:
  ; - Four explicit phases: p1 (modeler), p2 (auditor), p3 (simplifier), p4 (orchestrator).
  ; - Each actor (modeler, auditor, simplifier, orchestrator) may only perform the actions assigned to its role.
  ; - Phase contiguity and ordering are enforced via next/ current-phase / completed-by-phase predicates.
  ; - No penalty, token, or post-hoc shortfall mechanisms are used; constraints are encoded so violating plans are impossible.
  (:requirements :strips :typing :negative-preconditions)
  (:types agent model phase)

  (:predicates
    ; Agent role markers (assign a single role to each agent object in the problem)
    (is-modeler ?a - agent)
    (is-auditor ?a - agent)
    (is-simplifier ?a - agent)
    (is-orchestrator ?a - agent)

    ; Phase objects and ordering
    (phase ?p - phase)
    (next ?p1 ?p2 - phase)
    (current-phase ?p - phase)
    (completed-by-phase ?p - phase)

    ; Model artifact states
    (model-draft ?m - model)
    (model-corrected ?m - model)
    (model-canonical ?m - model)
    (model-integrated ?m - model)
    (validated ?m - model)

    ; Provenance predicates (who performed which step)
    (created-by ?m - model ?a - agent)
    (corrected-by ?m - model ?a - agent)
    (mapped-by ?m - model ?a - agent)
    (integrated-by ?m - model ?a - agent)
    (validated-by ?m - model ?a - agent)
  )

  ; Modeler: create an initial symbolic model in phase p1. This marks phase p1 completed.
  (:action create-model
    :parameters (?ag - agent ?m - model)
    :precondition (and
      (is-modeler ?ag)
      (current-phase p1)
      (not (model-draft ?m))
    )
    :effect (and
      (model-draft ?m)
      (created-by ?m ?ag)
      (completed-by-phase p1)
    )
  )

  ; Auditor: apply corrections only in phase p2 and only after a draft exists.
  (:action auditor-correct-model
    :parameters (?ag - agent ?m - model)
    :precondition (and
      (is-auditor ?ag)
      (current-phase p2)
      (model-draft ?m)
      (not (model-corrected ?m))
    )
    :effect (and
      (model-corrected ?m)
      (corrected-by ?m ?ag)
      (completed-by-phase p2)
    )
  )

  ; Simplifier: produce canonical mapping only in phase p3 and only after auditor corrections.
  (:action simplifier-map-model
    :parameters (?ag - agent ?m - model)
    :precondition (and
      (is-simplifier ?ag)
      (current-phase p3)
      (model-corrected ?m)
      (not (model-canonical ?m))
    )
    :effect (and
      (model-canonical ?m)
      (mapped-by ?m ?ag)
      (completed-by-phase p3)
    )
  )

  ; Orchestrator: integrate and validate only in phase p4 and only after canonical mapping exists.
  (:action orchestrator-integrate-validate
    :parameters (?ag - agent ?m - model)
    :precondition (and
      (is-orchestrator ?ag)
      (current-phase p4)
      (model-canonical ?m)
      (model-corrected ?m)
      (model-draft ?m)
      (not (model-integrated ?m))
    )
    :effect (and
      (model-integrated ?m)
      (integrated-by ?m ?ag)
      (validated ?m)
      (validated-by ?m ?ag)
      (completed-by-phase p4)
    )
  )

  ; Advance the active phase to the next phase. Only the orchestrator may advance phases.
  ; This action enforces contiguity: it requires the current phase to be completed and a next relation.
  (:action advance-phase
    :parameters (?ag - agent ?p - phase ?q - phase)
    :precondition (and
      (is-orchestrator ?ag)
      (current-phase ?p)
      (next ?p ?q)
      (completed-by-phase ?p)
    )
    :effect (and
      (not (current-phase ?p))
      (current-phase ?q)
    )
  )
)