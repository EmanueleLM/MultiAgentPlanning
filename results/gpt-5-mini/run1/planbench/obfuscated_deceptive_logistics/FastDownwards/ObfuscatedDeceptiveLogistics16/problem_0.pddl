(define (problem integrate-model)
  (:domain model-integration)
  ; Objects: one agent per role, one model, four explicit phases
  (:objects
    modeler auditor simplifier orchestrator - agent
    m1 - model
    p1 p2 p3 p4 - phase
  )

  (:init
    ; Assign roles to the agent objects (each object is a distinct actor with a single role)
    (is-modeler modeler)
    (is-auditor auditor)
    (is-simplifier simplifier)
    (is-orchestrator orchestrator)

    ; Declare phases and the required linear order p1 -> p2 -> p3 -> p4
    (phase p1) (phase p2) (phase p3) (phase p4)
    (next p1 p2) (next p2 p3) (next p3 p4)

    ; Initial active phase is p1 (model creation)
    (current-phase p1)

    ; No model artifact facts initially (m1 must be produced by create-model)
    ; (All other predicates default to false in the initial state)
  )

  ; Goal: The final integrated and validated model exists, and phase p4 has been completed.
  ; This fixes all mandated terminal conditions: integration and validation completed and final phase completed.
  (:goal (and
    (model-integrated m1)
    (validated m1)
    (completed-by-phase p4)
  ))
)