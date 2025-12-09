(define (problem orchestrated-problem)
  (:domain orchestrated)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11 - object

    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 - stage
  )

  (:init
    ;; Initial facts (from the human specification)
    (cats object_0)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (hand object_10)
    (hand object_11)
    (hand object_9)
    (next object_0 object_5)
    (next object_10 object_8)
    (next object_11 object_6)
    (next object_3 object_5)
    (next object_4 object_7)
    (next object_9 object_5)
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

    ;; Stage ordering and current stage (explicit discrete time)
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (current stage_0)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_9 object_7)
  ))
)