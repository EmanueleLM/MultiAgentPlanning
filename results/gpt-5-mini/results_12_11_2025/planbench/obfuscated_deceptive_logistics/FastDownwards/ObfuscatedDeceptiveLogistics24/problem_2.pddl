(define (problem obfuscated-deceptive-logistics-scenario1)
  (:domain obfuscated-deceptive-logistics)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13 - object
    ;; stages s0 .. s12 to allow up to 12 ordered actions (one stage advance per action)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )

  (:init
    ;; cats
    (cats object_0)
    (cats object_1)

    ;; collect relations
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; hands
    (hand object_12)
    (hand object_13)

    ;; next relations (locations / adjacency)
    (next object_0 object_9)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_7)
    (next object_4 object_8)
    (next object_5 object_11)

    ;; sneezes
    (sneeze object_4)
    (sneeze object_5)

    ;; springs and stupendous
    (spring object_6)
    (spring object_9)
    (stupendous object_2)
    (stupendous object_3)

    ;; textures
    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; stage ordering (succ) and initial clock
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
    (succ s11 s12)
    (now s0)
  )

  (:goal (and
    (next object_12 object_10)
    (next object_13 object_9)
  ))
)