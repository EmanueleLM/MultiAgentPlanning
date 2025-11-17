(define (problem objects-play-problem)
  (:domain objects-play)

  (:objects
    object_2 object_4 object_8 object_9 object_10 object_11 object_12 - object
    stage0 stage1 stage2 stage3 stage4 stage5 - stage
  )

  (:init
    ;; minimal stage chain (enough steps for the provided plan fragments)
    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage5)
    (current stage0)

    ;; Scenario 1: only the facts actually required by the provided plan
    (sneeze object_4)
    (hand object_11)
    (texture object_10)
    (texture object_8)
    (texture object_9)
    (stupendous object_2)
    (next object_4 object_10)   ; enables first wretched -> next(object_4,object_8)
    (next object_11 object_8)   ; required by clip step
    (collect object_10 object_2)
    (collect object_8 object_2)
    (collect object_9 object_2)

    ;; Scenario 2: minimal facts to enable memory yielding next object_12 object_11
    (cats object_12)
    (spring object_10)
    (spring object_11)
    (next object_12 object_10)
  )

  (:goal (and
    (next object_11 object_9)
    (next object_12 object_11)
  ))
)