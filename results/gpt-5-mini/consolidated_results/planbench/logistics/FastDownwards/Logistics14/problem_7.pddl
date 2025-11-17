(define (problem repoint-problem)
  (:domain repoint-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - item
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 step16 step17 step18 step19 - step
  )

  (:init
    ;; facts from the specified initial scenario
    (cats object_0)
    (cats object_1)

    (hand object_10)
    (hand object_11)
    (hand object_12)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_8)
    (next object_11 object_9)
    (next object_12 object_6)
    (next object_4 object_6)
    (next object_5 object_9)

    ;; explicit, contiguous stage ordering; planner must satisfy actions that advance the single active stage
    (succ step0 step1) (succ step1 step2) (succ step2 step3) (succ step3 step4)
    (succ step4 step5) (succ step5 step6) (succ step6 step7) (succ step7 step8)
    (succ step8 step9) (succ step9 step10) (succ step10 step11) (succ step11 step12)
    (succ step12 step13) (succ step13 step14) (succ step14 step15) (succ step15 step16)
    (succ step16 step17) (succ step17 step18) (succ step18 step19)

    ;; only one active stage at start; all actions require advancing from the current active stage
    (at-step step0)
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))
)