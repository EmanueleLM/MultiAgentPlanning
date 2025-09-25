(define (problem meet-nancy-orchestration)
  (:domain multiagent-meet)
  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39 t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 - time
  )

  (:init
    (at traveler sunset)
    (at nancy haight)
    (now t0)

    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)
    (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10)
    (succ t10 t11) (succ t11 t12) (succ t12 t13) (succ t13 t14) (succ t14 t15)
    (succ t15 t16) (succ t16 t17) (succ t17 t18) (succ t18 t19) (succ t19 t20)
    (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24) (succ t24 t25)
    (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29) (succ t29 t30)
    (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35)
    (succ t35 t36) (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40)
    (succ t40 t41) (succ t41 t42) (succ t42 t43) (succ t43 t44) (succ t44 t45)
    (succ t45 t46) (succ t46 t47) (succ t47 t48) (succ t48 t49) (succ t49 t50)
    (succ t50 t51)

    (after5 t0 t5) (after5 t1 t6) (after5 t2 t7) (after5 t3 t8) (after5 t4 t9)
    (after5 t5 t10) (after5 t6 t11) (after5 t7 t12) (after5 t8 t13) (after5 t9 t14)
    (after5 t10 t15) (after5 t11 t16) (after5 t12 t17) (after5 t13 t18) (after5 t14 t19)
    (after5 t15 t20) (after5 t16 t21) (after5 t17 t22) (after5 t18 t23) (after5 t19 t24)
    (after5 t20 t25) (after5 t21 t26) (after5 t22 t27) (after5 t23 t28) (after5 t24 t29)
    (after5 t25 t30) (after5 t26 t31) (after5 t27 t32) (after5 t28 t33) (after5 t29 t34)
    (after5 t30 t35) (after5 t31 t36) (after5 t32 t37) (after5 t33 t38) (after5 t34 t39)
    (after5 t35 t40) (after5 t36 t41) (after5 t37 t42) (after5 t38 t43) (after5 t39 t44)
    (after5 t40 t45) (after5 t41 t46) (after5 t42 t47) (after5 t43 t48) (after5 t44 t49)
    (after5 t45 t50) (after5 t46 t51)

    (between42to46 t42) (between42to46 t43) (between42to46 t44) (between42to46 t45) (between42to46 t46)
  )

  (:goal (met traveler nancy))
)