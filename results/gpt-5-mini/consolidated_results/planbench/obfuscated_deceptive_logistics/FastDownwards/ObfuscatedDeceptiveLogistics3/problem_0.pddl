(define (problem audited_scenario)
  (:domain multiagent-orchestration)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 - obj
  )

  ;; Explicit initial facts required by the audited plan (inferred and made explicit).
  ;; These are the minimal atoms the plan needs, provided in the initial state.
  (:init
    ;; Required static capabilities/attributes
    (cats object_0)
    (hand object_8)
    (hand object_7)
    (texture object_6)
    (texture object_5)
    (spring object_6)
    (spring object_5)

    ;; Seed 'next' relations required by the action schemas so that actions can causally produce the inferred final nexts.
    (next object_8 object_6)
    (next object_7 object_6)
    (next object_0 object_6)
  )

  ;; Goals (the auditor's inferred / reconciled terminal conditions).
  ;; These must hold in the final state; the domain contains only actions that can produce them causally.
  (:goal (and
    (next object_8 object_5)
    (next object_7 object_5)
  ))
)