(define (problem logistics_objects-problem)
  (:domain logistics_objects)
  (:objects
    ;; Scenario 1 objects
    object_0_s1 - cats
    object_1_s1 object_2_s1 - stupendous
    object_3_s1 object_4_s1 - sneeze
    object_9_s1 object_10_s1 object_11_s1 - hand
    object_5_s1 object_6_s1 object_7_s1 object_8_s1 - obj

    ;; Scenario 2 objects
    object_0_s2 object_1_s2 - cats
    object_2_s2 object_3_s2 - stupendous
    object_4_s2 object_5_s2 - sneeze
    object_10_s2 object_11_s2 object_12_s2 - hand
    object_6_s2 object_7_s2 object_8_s2 object_9_s2 - obj
  )

  (:init
    ;; -------- Scenario 1 initial facts (trimmed: typed objects removed) --------
    (collect object_5_s1 object_1_s1)
    (collect object_6_s1 object_1_s1)
    (collect object_7_s1 object_2_s1)
    (collect object_8_s1 object_2_s1)
    (next object_0_s1 object_5_s1)
    (next object_10_s1 object_5_s1)
    (next object_11_s1 object_5_s1)
    (next object_3_s1 object_6_s1)
    (next object_4_s1 object_7_s1)
    (next object_9_s1 object_8_s1)
    (spring object_5_s1)
    (spring object_7_s1)
    (texture object_5_s1)
    (texture object_6_s1)
    (texture object_7_s1)
    (texture object_8_s1)

    ;; -------- Scenario 2 initial facts (trimmed: typed objects removed) --------
    (collect object_6_s2 object_2_s2)
    (collect object_7_s2 object_2_s2)
    (collect object_8_s2 object_3_s2)
    (collect object_9_s2 object_3_s2)
    (next object_0_s2 object_6_s2)
    (next object_1_s2 object_8_s2)
    (next object_10_s2 object_9_s2)
    (next object_11_s2 object_6_s2)
    (next object_12_s2 object_6_s2)
    (next object_4_s2 object_7_s2)
    (next object_5_s2 object_8_s2)
    (spring object_6_s2)
    (spring object_8_s2)
    (texture object_6_s2)
    (texture object_7_s2)
    (texture object_8_s2)
    (texture object_9_s2)
  )

  (:goal
    (and
      ;; Goals for scenario 1
      (next object_10_s1 object_8_s1)
      (next object_11_s1 object_7_s1)
      (next object_9_s1 object_6_s1)

      ;; Goals for scenario 2
      (next object_10_s2 object_7_s2)
      (next object_11_s2 object_9_s2)
      (next object_12_s2 object_8_s2)
    )
  )
)