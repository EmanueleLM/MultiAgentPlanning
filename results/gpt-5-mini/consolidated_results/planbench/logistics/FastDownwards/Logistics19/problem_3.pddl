(define (problem scenario-combined)
  (:domain linking)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 - object
    stage_0 stage_1 stage_2 stage_3 stage_4 stage_5 stage_6 stage_7 stage_8 stage_9 stage_10 stage_11 - stage
  )
  (:init
    ;; stage ordering and initial current stage
    (succ stage_0 stage_1)
    (succ stage_1 stage_2)
    (succ stage_2 stage_3)
    (succ stage_3 stage_4)
    (succ stage_4 stage_5)
    (succ stage_5 stage_6)
    (succ stage_6 stage_7)
    (succ stage_7 stage_8)
    (succ stage_8 stage_9)
    (succ stage_9 stage_10)
    (succ stage_10 stage_11)
    (current-stage stage_0)

    ;; persistent facts (union of provided initial statements)
    (cats object_0)

    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (hand object_11)

    ;; next facts (union of both initial statements)
    (next object_0 object_8)
    (next object_11 object_6)
    (next object_3 object_7)
    (next object_4 object_8)

    (next object_0 object_5)
    (next object_11 object_8)
    (next object_3 object_5)
    (next object_4 object_10)

    ;; sneeze, spring, stupendous, texture facts
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
  (:goal (and
    (next object_11 object_10)
    (next object_11 object_9)
  ))
)