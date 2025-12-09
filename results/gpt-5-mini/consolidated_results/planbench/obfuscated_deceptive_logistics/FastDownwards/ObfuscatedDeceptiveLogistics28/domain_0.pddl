(define (domain pipeline-domain)
  (:requirements :strips :typing :negative-preconditions)

  ;; Types for the pipeline
  (:types
    phase
    dataset
    model
    analyzer
    synthesizer
    auditor
    orchestrator
  )

  ;; Predicates
  ;; Phase management
  (:predicates
    (current-phase ?p - phase)
    (phase-next ?p - phase ?q - phase)

    ;; Permissions for which phase an action is allowed in
    (allowed-analyze ?p - phase)
    (allowed-synthesize ?p - phase)
    (allowed-audit ?p - phase)
    (allowed-deliver ?p - phase)

    ;; Data and artifact facts
    (analyzed ?d - dataset)
    (analysis-done-by ?d - dataset ?a - analyzer)

    (model-created ?m - model)
    (model-valid ?m - model)
    (synthesized-by ?m - model ?s - synthesizer)

    (audited ?m - model)
    (audited-by ?m - model ?u - auditor)

    (delivered ?m - model)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions contributed by the "Analyzer" agent (analysis phase)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; The analyze action is only permitted in phases marked as allowed-analyze.
  ;; It requires the pipeline to be in the current phase and advances the phase
  ;; to the next phase specified by phase-next.
  (:action analyze
    :parameters (?an - analyzer ?d - dataset ?p - phase ?q - phase)
    :precondition (and
      (current-phase ?p)
      (phase-next ?p ?q)
      (allowed-analyze ?p)
      (not (analyzed ?d))
    )
    :effect (and
      (analyzed ?d)
      (analysis-done-by ?d ?an)
      (not (current-phase ?p))
      (current-phase ?q)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions contributed by the "Synthesizer" agent (synthesis phase)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; The synthesize action is only permitted in phases marked as allowed-synthesize.
  ;; It requires analyzed data and advances the pipeline to the next phase.
  ;; It must create a model and must mark that model valid (no post-hoc fixes allowed).
  (:action synthesize
    :parameters (?s - synthesizer ?d - dataset ?m - model ?p - phase ?q - phase)
    :precondition (and
      (current-phase ?p)
      (phase-next ?p ?q)
      (allowed-synthesize ?p)
      (analyzed ?d)
      (not (model-created ?m))
    )
    :effect (and
      (model-created ?m)
      (model-valid ?m)               ; hard constraint: synthesized models are valid
      (synthesized-by ?m ?s)
      (not (current-phase ?p))
      (current-phase ?q)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Actions contributed by the "Auditor" agent (audit phase)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; The audit action is only permitted in phases marked as allowed-audit.
  ;; It requires a created, valid model and advances the pipeline to the next phase.
  (:action audit
    :parameters (?u - auditor ?m - model ?p - phase ?q - phase)
    :precondition (and
      (current-phase ?p)
      (phase-next ?p ?q)
      (allowed-audit ?p)
      (model-created ?m)
      (model-valid ?m)
      (not (audited ?m))
    )
    :effect (and
      (audited ?m)
      (audited-by ?m ?u)
      (not (current-phase ?p))
      (current-phase ?q)
    )
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Action contributed by the "Orchestrator" agent (delivery / terminal phase)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; The deliver action is only permitted in phases marked as allowed-deliver.
  ;; It requires that the model has been audited. It does not allow delivery
  ;; unless prior phases and constraints have been satisfied.
  (:action deliver
    :parameters (?o - orchestrator ?m - model ?p - phase)
    :precondition (and
      (current-phase ?p)
      (allowed-deliver ?p)
      (audited ?m)
      (not (delivered ?m))
    )
    :effect (and
      (delivered ?m)
      ;; keep current-phase ?p as the terminal phase, do not revert or bypass
    )
  )
)