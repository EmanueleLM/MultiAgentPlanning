(define (domain model-integration)
  (:requirements :typing :negative-preconditions)
  (:types agent model phase)
  (:constants p1 p2 p3 p4 - phase)
  (:predicates
    (is-modeler ?a - agent)
    (is-auditor ?a - agent)
    (is-simplifier ?a - agent)
    (is-orchestrator ?a - agent)
    (phase ?p - phase)
    (next ?p1 ?p2 - phase)
    (current-phase ?p - phase)
    (completed-by-phase ?p - phase)
    (model-draft ?m - model)
    (model-corrected ?m - model)
    (model-canonical ?m - model)
    (model-integrated ?m - model)
    (validated ?m - model)
    (created-by ?m - model ?a - agent)
    (corrected-by ?m - model ?a - agent)
    (mapped-by ?m - model ?a - agent)
    (integrated-by ?m - model ?a - agent)
    (validated-by ?m - model ?a - agent)
  )

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