(define (problem linking-problem)
  (:domain linking-domain)
  (:objects
    worker - agent
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - obj
    stage_0 stage_1 - stage
  )

  (:init
    ;; agent availability
    (available-agent worker)

    ;; stage ordering and occupancy: initial facts live at stage_0, so mark it used.
    (stage-succ stage_0 stage_1)
    (used-stage stage_0)

    ;; Normalized initial facts (time-stamped where appropriate). All given ground facts are included.
    ;; The original "next x y" facts are represented as (next-at x y stage_0).
    (next-at object_0 object_8 stage_0)
    (next-at object_11 object_6 stage_0)
    (next-at object_3 object_7 stage_0)
    (next-at object_4 object_8 stage_0)

    (cats object_0)

    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (hand object_11)

    (sneeze object_3)
    (sneeze object_4)

    (spring object_5)
    (spring object_8)

    (stupendous object_1)
    (stupendous object_2)

    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)
  )

  ;; Goal: require the target directed successor relation to hold at the explicitly designated later stage.
  ;; This enforces a terminal condition at a concrete stage (stage_1).
  (:goal (next-at object_11 object_10 stage_1))
)