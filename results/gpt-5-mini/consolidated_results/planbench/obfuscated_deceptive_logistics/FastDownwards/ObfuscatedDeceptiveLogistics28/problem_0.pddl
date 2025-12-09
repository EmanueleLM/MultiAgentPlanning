(define (problem pipeline-problem)
  (:domain pipeline-domain)

  ;; Objects: phases, a dataset, a model, and one agent of each role.
  (:objects
    ph1 ph2 ph3 ph4 - phase
    data1 - dataset
    model1 - model
    analyzer1 - analyzer
    synthesizer1 - synthesizer
    auditor1 - auditor
    orchestrator1 - orchestrator
  )

  (:init
    ;; Initial pipeline phase
    (current-phase ph1)

    ;; Phase ordering (enforces contiguous sequence ph1 -> ph2 -> ph3 -> ph4)
    (phase-next ph1 ph2)
    (phase-next ph2 ph3)
    (phase-next ph3 ph4)

    ;; Declare which actions are permitted in which phases
    (allowed-analyze ph1)
    (allowed-synthesize ph2)
    (allowed-audit ph3)
    (allowed-deliver ph4)

    ;; No analysis, model, audit, or delivery facts are true initially.
    ;; (These facts must be produced by the corresponding actions.)
  )

  ;; Goal: all mandated terminal conditions are true.
  ;; The pipeline must have analyzed the dataset, created a valid model,
  ;; audited it, and delivered it. Also require that the pipeline reached
  ;; the final phase (ph4) so ordering is enforced in the final state.
  (:goal (and
    (analyzed data1)
    (model-created model1)
    (model-valid model1)
    (audited model1)
    (delivered model1)
    (current-phase ph4)
  ))
)