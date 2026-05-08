(define (problem obfuscated-deceptive-logistics-17-prob)
  (:domain obfuscated-deceptive-logistics-17)

  (:objects
    ;; domain objects (all typed as obj)
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - obj

    ;; discrete stages: s0 is initial current-stage; we provide a contiguous successor chain up to s12.
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - stage
  )

  (:init
    ;; Initial propositional facts as provided
    (cats object_0)
    (cats object_1)

    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (hand object_10)
    (hand object_11)
    (hand object_12)
    (hand object_13)

    (next object_0 object_8)
    (next object_1 object_8)

    (next object_10 object_7)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_9)

    (next object_4 object_7)
    (next object_5 object_9)

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

    ;; Explicit successor chain for stages (enforces ordered progression)
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

    ;; Start at first stage
    (current-stage s0)
  )

  (:goal (and
    ;; Terminal conditions (must hold exactly at goal time)
    (next object_10 object_6)
    (next object_11 object_8)
    (next object_12 object_7)
    (next object_13 object_9)
    ;; Require that the plan has advanced to the prescribed final stage,
    ;; ensuring contiguous stage progression is respected.
    (current-stage s12)
  ))
)