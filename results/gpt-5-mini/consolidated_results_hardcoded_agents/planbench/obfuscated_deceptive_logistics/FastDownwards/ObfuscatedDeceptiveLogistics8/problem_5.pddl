(define (problem obfuscated_deceptive_logistics_problem)
  (:domain obfuscated_deceptive_logistics)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:init
    ;; unary facts (as provided)
    (cats object_0)

    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)

    (hand object_10)
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

    ;; initial next relations are anchored at stage_0
    (next_at object_0 object_5 stage_0)
    (next_at object_10 object_5 stage_0)
    (next_at object_3 object_5 stage_0)
    (next_at object_4 object_8 stage_0)
    (next_at object_9 object_5 stage_0)

    ;; stage ordering and initial current stage
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)

    (current_stage stage_0)
  )

  (:goal
    (and
      ;; require the target adjacency to hold at the final stage and that the
      ;; plan has advanced to that stage (terminal condition enforced exactly)
      (next_at object_10 object_6 stage_5)
      (next_at object_9 object_6 stage_5)
      (current_stage stage_5)
    )
  )
)