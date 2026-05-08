(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; All objects provided by the observer (type: object)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6
    object_7 object_8 object_9 object_10 object_11 - object
  )

  ;; Assumptions / notes (conservative, documented here):
  ;; - Predicates hand, cats, texture, sneeze, spring, stupendous, collect are treated as static in this instance:
  ;;   they only appear in initial state and as preconditions of actions (no action adds or deletes them).
  ;; - The domain enforces pairwise distinctness among action parameters where appropriate via explicit (not (= ...)) preconditions.
  ;; - "Move" actions (memory_agent3, wretched_agent2) require that the destination next(...) fact is absent before moving,
  ;;   enforcing that these actions effect a genuine relocation rather than producing duplicate parallel links.
  ;; - No bookkeeping tokens, quotas, or penalty actions are present; all preferences from the description have been encoded as hard constraints.

  (:init
    ;; For memory_agent3 to produce (next object_10 object_7):
    (cats object_10)
    (spring object_0)
    (spring object_7)
    (next object_10 object_0)

    ;; For wretched_agent2 to produce (next object_11 object_7):
    (sneeze object_11)
    (texture object_1)
    (texture object_7)
    (stupendous object_2)
    (next object_11 object_1)
    (collect object_1 object_2)
    (collect object_7 object_2)

    ;; For tightfisted_agent1 to produce (next object_9 object_7):
    (hand object_9)
    (sneeze object_3)
    ;; texture object_7 already declared above
    (next object_3 object_7)
    (vase object_9 object_3)

    ;; Additional static facts (not strictly required by the chosen plan but part of the domain's static typing)
    (hand object_0)    ;; harmless extra static role assignments
    (cats object_1)
    (texture object_0)
    (sneeze object_4)
    (spring object_5)
    (stupendous object_6)
    ;; No initial target next facts for the goals (ensures move/create actions are necessary):
    ;; (not (next object_10 object_7)) - implicit because it's not listed above
    ;; (not (next object_11 object_7)) - implicit
    ;; (not (next object_9 object_7))  - implicit
  )

  ;; Goal: enforce every mandated terminal condition exactly as given
  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_9 object_7)
  ))
)