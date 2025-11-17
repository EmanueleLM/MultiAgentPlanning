(define (problem obfuscated-deceptive-logistics-scenario1)
  (:domain obfuscated-deceptive-logistics)

  (:objects
    ;; objects typed to encode unary invariants in the object declaration (reduces :init facts)
    object_12 object_13 - hand-object
    object_0 object_1 - cat-object
    object_4 object_5 - sneeze-object
    object_10 object_11 object_6 object_7 object_8 object_9 - texture-object
    object_2 object_3 - stupendous-object

    ;; remaining plain objects (appear in relations but have no unary predicate in original)
    object_5_p object_6_p object_7_p object_8_p - object
    ;; Note: to keep names consistent with plan we also include the plain-named objects used by operators.
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 - object

    ;; minimal stage chain for 11 actions (s0..s11)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 - stage
  )

  (:init
    ;; collect relations (only those required by the plan / reachable preconditions)
    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    ;; minimal next relations required by plan preconditions
    (next object_12 object_11)
    (next object_5 object_11)
    (next object_13 object_7)
    (next object_1 object_9)
    (next object_4 object_8)

    ;; spring facts (kept as predicates because they overlap with texture)
    (spring object_6)
    (spring object_9)

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