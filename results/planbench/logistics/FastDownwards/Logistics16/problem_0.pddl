(define (problem objects_problem)
  (:domain objects_domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj
  )

  (:init
    ;; Statement A initial facts (integrated)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_9)
    (next object_0 object_5)
    (next object_10 object_7)
    (next object_11 object_8)
    (next object_12 object_5)
    (next object_3 object_6)
    (next object_4 object_8)
    (next object_9 object_8)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_7)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)

    ;; Statement B initial facts (integrated)
    (cats object_1)
    (collect object_6 object_2)
    (collect object_7 object_2) ;; duplicate allowed
    (collect object_8 object_3)
    (collect object_9 object_3)
    (hand object_13)
    (next object_0 object_6)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_11 object_8) ;; already in A
    (next object_12 object_9)
    (next object_13 object_6)
    (next object_4 object_7) ;; already had next object_4 object_8 in A; both can coexist
    (next object_5 object_9)
    (sneeze object_5)
    (spring object_6)
    (spring object_8)
    (stupendous object_3)
    (texture object_9)

    ;; Note: all busy/blocked intervals were interpreted as unavailable; there were none explicitly provided.
    ;; No vase relations are present initially (vase facts would be added by actions at runtime).
  )

  ;; Combined goals: union of Statement A and Statement B goal facts.
  ;; These are encoded as strict constraints that must all hold in the final state.
  (:goal
    (and
      ;; Statement A goals
      (next object_10 object_8)
      (next object_11 object_6)
      (next object_12 object_8)
      (next object_9 object_5)

      ;; Statement B goals
      (next object_10 object_6)
      (next object_11 object_9)
      (next object_12 object_7)
      (next object_13 object_9)
    )
  )
)