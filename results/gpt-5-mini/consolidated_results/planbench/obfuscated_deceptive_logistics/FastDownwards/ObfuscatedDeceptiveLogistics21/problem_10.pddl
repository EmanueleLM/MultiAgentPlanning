(define (problem ObfuscatedDeceptiveLogistics21-problem)
  (:domain ObfuscatedDeceptiveLogistics21)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
    stage_0 stage_1 stage_2 stage_3 stage_4 - stage
  )
  (:init
    ;; Initial facts from Statement A (planner_alpha private initial facts)
    (cats object_0)
    (cats object_1)

    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    (hand object_12)

    (next object_0 object_6)
    (next object_1 object_9)
    (next object_12 object_10)
    (next object_4 object_7)
    (next object_5 object_9)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; stage/time bookkeeping (discrete, contiguous progression required)
    (current stage_0)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
  )
  (:goal (and
    ;; Goal from Statement A
    (next object_12 object_11)
  ))
)