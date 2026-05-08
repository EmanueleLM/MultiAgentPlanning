(define (problem integrate-model)
  (:domain model-integration)
  (:objects
    modeler auditor simplifier orchestrator - agent
    m1 - model
  )
  (:init
    (is-modeler modeler)
    (is-auditor auditor)
    (is-simplifier simplifier)
    (is-orchestrator orchestrator)
    (phase p1) (phase p2) (phase p3) (phase p4)
    (next p1 p2) (next p2 p3) (next p3 p4)
    (current-phase p1)
  )
  (:goal (and
    (model-integrated m1)
    (validated m1)
    (completed-by-phase p4)
  ))
)