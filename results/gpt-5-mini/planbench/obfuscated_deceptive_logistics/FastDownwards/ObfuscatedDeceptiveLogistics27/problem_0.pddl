(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 object_13 object_14 - obj
  )

  (:init
    ;; unary/type facts (from provided initial facts)
    (cats object_0)
    (cats object_1)

    (collect object_10 object_3)
    (collect object_11 object_3)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)

    (hand object_12)
    (hand object_13)
    (hand object_14)

    (next object_0 object_6)
    (next object_1 object_9)
    (next object_12 object_11)
    (next object_13 object_6)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_9)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_10)
    (texture object_11)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; explicit inequality facts used to enforce distinctness constraints
    ;; (Enumerated for all ordered unequal pairs among the 15 objects)
    ;; For each pair X != Y include (neq X Y)
    (neq object_0 object_1) (neq object_0 object_2) (neq object_0 object_3) (neq object_0 object_4) (neq object_0 object_5) (neq object_0 object_6) (neq object_0 object_7) (neq object_0 object_8) (neq object_0 object_9) (neq object_0 object_10) (neq object_0 object_11) (neq object_0 object_12) (neq object_0 object_13) (neq object_0 object_14)
    (neq object_1 object_0) (neq object_1 object_2) (neq object_1 object_3) (neq object_1 object_4) (neq object_1 object_5) (neq object_1 object_6) (neq object_1 object_7) (neq object_1 object_8) (neq object_1 object_9) (neq object_1 object_10) (neq object_1 object_11) (neq object_1 object_12) (neq object_1 object_13) (neq object_1 object_14)
    (neq object_2 object_0) (neq object_2 object_1) (neq object_2 object_3) (neq object_2 object_4) (neq object_2 object_5) (neq object_2 object_6) (neq object_2 object_7) (neq object_2 object_8) (neq object_2 object_9) (neq object_2 object_10) (neq object_2 object_11) (neq object_2 object_12) (neq object_2 object_13) (neq object_2 object_14)
    (neq object_3 object_0) (neq object_3 object_1) (neq object_3 object_2) (neq object_3 object_4) (neq object_3 object_5) (neq object_3 object_6) (neq object_3 object_7) (neq object_3 object_8) (neq object_3 object_9) (neq object_3 object_10) (neq object_3 object_11) (neq object_3 object_12) (neq object_3 object_13) (neq object_3 object_14)
    (neq object_4 object_0) (neq object_4 object_1) (neq object_4 object_2) (neq object_4 object_3) (neq object_4 object_5) (neq object_4 object_6) (neq object_4 object_7) (neq object_4 object_8) (neq object_4 object_9) (neq object_4 object_10) (neq object_4 object_11) (neq object_4 object_12) (neq object_4 object_13) (neq object_4 object_14)
    (neq object_5 object_0) (neq object_5 object_1) (neq object_5 object_2) (neq object_5 object_3) (neq object_5 object_4) (neq object_5 object_6) (neq object_5 object_7) (neq object_5 object_8) (neq object_5 object_9) (neq object_5 object_10) (neq object_5 object_11) (neq object_5 object_12) (neq object_5 object_13) (neq object_5 object_14)
    (neq object_6 object_0) (neq object_6 object_1) (neq object_6 object_2) (neq object_6 object_3) (neq object_6 object_4) (neq object_6 object_5) (neq object_6 object_7) (neq object_6 object_8) (neq object_6 object_9) (neq object_6 object_10) (neq object_6 object_11) (neq object_6 object_12) (neq object_6 object_13) (neq object_6 object_14)
    (neq object_7 object_0) (neq object_7 object_1) (neq object_7 object_2) (neq object_7 object_3) (neq object_7 object_4) (neq object_7 object_5) (neq object_7 object_6) (neq object_7 object_8) (neq object_7 object_9) (neq object_7 object_10) (neq object_7 object_11) (neq object_7 object_12) (neq object_7 object_13) (neq object_7 object_14)
    (neq object_8 object_0) (neq object_8 object_1) (neq object_8 object_2) (neq object_8 object_3) (neq object_8 object_4) (neq object_8 object_5) (neq object_8 object_6) (neq object_8 object_7) (neq object_8 object_9) (neq object_8 object_10) (neq object_8 object_11) (neq object_8 object_12) (neq object_8 object_13) (neq object_8 object_14)
    (neq object_9 object_0) (neq object_9 object_1) (neq object_9 object_2) (neq object_9 object_3) (neq object_9 object_4) (neq object_9 object_5) (neq object_9 object_6) (neq object_9 object_7) (neq object_9 object_8) (neq object_9 object_10) (neq object_9 object_11) (neq object_9 object_12) (neq object_9 object_13) (neq object_9 object_14)
    (neq object_10 object_0) (neq object_10 object_1) (neq object_10 object_2) (neq object_10 object_3) (neq object_10 object_4) (neq object_10 object_5) (neq object_10 object_6) (neq object_10 object_7) (neq object_10 object_8) (neq object_10 object_9) (neq object_10 object_11) (neq object_10 object_12) (neq object_10 object_13) (neq object_10 object_14)
    (neq object_11 object_0) (neq object_11 object_1) (neq object_11 object_2) (neq object_11 object_3) (neq object_11 object_4) (neq object_11 object_5) (neq object_11 object_6) (neq object_11 object_7) (neq object_11 object_8) (neq object_11 object_9) (neq object_11 object_10) (neq object_11 object_12) (neq object_11 object_13) (neq object_11 object_14)
    (neq object_12 object_0) (neq object_12 object_1) (neq object_12 object_2) (neq object_12 object_3) (neq object_12 object_4) (neq object_12 object_5) (neq object_12 object_6) (neq object_12 object_7) (neq object_12 object_8) (neq object_12 object_9) (neq object_12 object_10) (neq object_12 object_11) (neq object_12 object_13) (neq object_12 object_14)
    (neq object_13 object_0) (neq object_13 object_1) (neq object_13 object_2) (neq object_13 object_3) (neq object_13 object_4) (neq object_13 object_5) (neq object_13 object_6) (neq object_13 object_7) (neq object_13 object_8) (neq object_13 object_9) (neq object_13 object_10) (neq object_13 object_11) (neq object_13 object_12) (neq object_13 object_14)
    (neq object_14 object_0) (neq object_14 object_1) (neq object_14 object_2) (neq object_14 object_3) (neq object_14 object_4) (neq object_14 object_5) (neq object_14 object_6) (neq object_14 object_7) (neq object_14 object_8) (neq object_14 object_9) (neq object_14 object_10) (neq object_14 object_11) (neq object_14 object_12) (neq object_14 object_13)
  )

  (:goal (and
    (next object_12 object_10)
    (next object_13 object_10)
    (next object_14 object_9)
  ))
)