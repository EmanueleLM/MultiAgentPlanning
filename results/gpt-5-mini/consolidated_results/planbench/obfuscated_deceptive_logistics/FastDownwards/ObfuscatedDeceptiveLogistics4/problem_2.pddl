(define (problem obfuscated-deceptive-logistics-scenario1)
  (:domain obfuscated-deceptive-logistics)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 - obj
    s0 s1 s2 s3 s4 - stage
  )

  (:init
    ;; Initial facts from the first statement block (scenario 1)
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_3)

    (hand object_8)
    (hand object_9)

    (next object_0 object_6)
    (next object_1 object_6)
    (next object_4 object_6)
    (next object_5 object_7)
    (next object_8 object_7)
    (next object_9 object_7)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_7)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)

    ;; Stage succession: four actions will consume stages s0->s1->s2->s3->s4
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (current s0)
  )

  (:goal (and
    (next object_8 object_7)   ;; remains true from initial state
    (next object_9 object_6)   ;; must be produced by a legal sequence of actions respecting stages
  ))
)