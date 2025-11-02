(define (problem orchestrator-problem-variant1)
  (:domain orchestrator-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  ;; Initial facts: only include facts explicitly listed in the provided summaries.
  (:init
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)

    (stupendous object_2)
    (stupendous object_3)

    ;; Note: other facts referenced by the action schemas (e.g. specific texture, sneeze,
    ;; spring, next, vase facts) are not invented here because the public descriptions
    ;; were summaries. Any plan requiring undeclared facts will fail applicability
    ;; at planning/simulation time unless those facts are present.
  )

  ;; Chosen goal variant: select a goal that is directly supported by the explicit initial facts
  ;; (avoids inventing additional reachable predicates). This corresponds to one of the
  ;; provided goal variants (the orchestrator chooses the variant that is immediately satisfied).
  (:goal (and
    (stupendous object_2)
    (stupendous object_3)
  ))
)