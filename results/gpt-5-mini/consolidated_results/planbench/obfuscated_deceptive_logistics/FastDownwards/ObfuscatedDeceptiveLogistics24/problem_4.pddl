(define (problem obfuscated-deceptive-logistics-scenario1)
  (:domain obfuscated-deceptive-logistics)

  (:objects
    ;; typed objects: only those required by the plan & goal
    object_12 object_13 - hand-object
    object_1 - cat-object
    object_4 object_5 - sneeze-object
    object_11 object_10 object_8 object_7 object_6 object_9 - texture-object
    object_2 object_3 - stupendous-object

    ;; minimal stage chain for the planned steps (s0..s11)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - stage
  )

  (:init
    ;; collect relations required by the wretched steps in the plan
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)

    ;; spring facts required by the memory actions
    (spring object_6)
    (spring object_9)

    ;; minimal next relations required as initial seeds for the plan (others are produced by actions)
    (next object_12 object_11)
    (next object_5 object_11)
    (next object_13 object_7)
    (next object_1 object_9)
    (next object_4 object_8)

    ;; stage ordering and initial clock (succ chain sufficient for the planned steps)
    (succ s0 s1)
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (succ s10 s11)
    (now s0)
  )

  (:goal (and
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)