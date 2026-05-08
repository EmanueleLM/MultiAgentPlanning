(define (problem obfuscated-sequence-problem)
  (:domain obfuscated-sequence)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - node
    stage_0 stage_1 stage_2 stage_3 stage_4 - stage
  )

  (:init
    ;; Unary predicates
    (cats object_0)

    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_9)

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

    ;; collect relations
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; next relations as given initially
    (next object_0 object_5)
    (next object_10 object_7)
    (next object_11 object_8)
    (next object_12 object_5)
    (next object_3 object_6)
    (next object_4 object_8)
    (next object_9 object_8)

    ;; Stage structure: explicit linear chain of stages (successor relation)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)

    ;; Enforce contiguous stage consumption: mark stage_0 as already used (starting point).
    (used stage_0)
    ;; stages 1..4 are initially unused (absence of (used stage_i))
  )

  (:goal (and
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_12 object_8)
    (next object_9 object_5)
  ))
)