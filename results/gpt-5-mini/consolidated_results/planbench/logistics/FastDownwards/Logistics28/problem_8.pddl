(define (problem logistics28-problem)
  (:domain logistics28)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 - step
  )
  (:init
    (current-step s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)

    ;; unary predicates (union of provided initial statements)
    (cats object_0) (cats object_1)

    (hand object_11) (hand object_12) (hand object_13) (hand object_14)
    (hand object_12) (hand object_13) (hand object_14)

    (texture object_5) (texture object_6) (texture object_7) (texture object_8) (texture object_9) (texture object_10) (texture object_11)

    (sneeze object_3) (sneeze object_4) (sneeze object_5)

    (spring object_5) (spring object_6) (spring object_8) (spring object_9)

    (stupendous object_1) (stupendous object_2) (stupendous object_3)

    ;; collect relations (union of both statements)
    (collect object_10 object_3) (collect object_11 object_3)
    (collect object_6 object_2) (collect object_7 object_2) (collect object_8 object_2) (collect object_9 object_3)
    (collect object_10 object_2) (collect object_5 object_1) (collect object_6 object_1) (collect object_7 object_1) (collect object_9 object_2)

    ;; next relations (union of both statements)
    (next object_0 object_6) (next object_0 object_8)
    (next object_1 object_9)
    (next object_3 object_6)
    (next object_4 object_7) (next object_4 object_9)
    (next object_5 object_10)
    (next object_11 object_10)
    (next object_12 object_11) (next object_12 object_5)
    (next object_13 object_6) (next object_13 object_7)
    (next object_14 object_8) (next object_14 object_9)
  )
  (:goal (and
    ;; goals combined from both provided statements (all mandatory terminal conditions)
    (next object_12 object_10)
    (next object_13 object_10)
    (next object_14 object_9)
    (next object_11 object_9)
    (next object_12 object_8)
    (next object_13 object_5)
    (next object_14 object_7)
  ))
)