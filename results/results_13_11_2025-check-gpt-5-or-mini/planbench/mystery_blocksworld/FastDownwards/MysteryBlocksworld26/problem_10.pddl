(define (problem scenario_1)
  (:domain mysteryblocksworld26)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7
    object_8 object_9 object_10 object_11 object_12 object_13
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40
  )
  (:init
    (cats object_0)
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)
    (hand object_11)
    (hand object_12)
    (hand object_13)
    (next object_0 object_8)
    (next object_11 object_10)
    (next object_12 object_7)
    (next object_13 object_7)
    (next object_3 object_6)
    (next object_4 object_9)
    (sneeze object_3)
    (sneeze object_4)
    (spring object_5)
    (spring object_8)
    (stupendous object_1)
    (stupendous object_2)
    (texture object_10)
    (texture object_5)
    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    (now t0)
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)
    (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10)
    (succ t10 t11) (succ t11 t12) (succ t12 t13) (succ t13 t14) (succ t14 t15)
    (succ t15 t16) (succ t16 t17) (succ t17 t18) (succ t18 t19) (succ t19 t20)
    (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24) (succ t24 t25)
    (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29) (succ t29 t30)
    (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35)
    (succ t35 t36) (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40)
  )
  (:goal
    (and
      (next object_11 object_5)
      (next object_12 object_9)
      (next object_13 object_10)
    )
  )
)