(define (problem meet-jessica)
  (:domain meeting-domain)
  (:objects
    visitor jessica - agent
    haight sunset - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 - time
  )

  (:init
    (succ t0 t1) (succ t1 t2) (succ t2 t3) (succ t3 t4) (succ t4 t5)
    (succ t5 t6) (succ t6 t7) (succ t7 t8) (succ t8 t9) (succ t9 t10)
    (succ t10 t11) (succ t11 t12) (succ t12 t13) (succ t13 t14) (succ t14 t15)
    (succ t15 t16) (succ t16 t17) (succ t17 t18) (succ t18 t19) (succ t19 t20)
    (succ t20 t21) (succ t21 t22) (succ t22 t23) (succ t23 t24) (succ t24 t25)
    (succ t25 t26) (succ t26 t27) (succ t27 t28) (succ t28 t29) (succ t29 t30)
    (succ t30 t31) (succ t31 t32) (succ t32 t33) (succ t33 t34) (succ t34 t35)
    (succ t35 t36) (succ t36 t37) (succ t37 t38) (succ t38 t39) (succ t39 t40)
    (succ t40 t41) (succ t41 t42) (succ t42 t43) (succ t43 t44) (succ t44 t45)

    (at_time visitor haight t0)

    (at_time jessica sunset t25) (at_time jessica sunset t26) (at_time jessica sunset t27)
    (at_time jessica sunset t28) (at_time jessica sunset t29) (at_time jessica sunset t30)
    (at_time jessica sunset t31) (at_time jessica sunset t32) (at_time jessica sunset t33)
    (at_time jessica sunset t34) (at_time jessica sunset t35) (at_time jessica sunset t36)
    (at_time jessica sunset t37) (at_time jessica sunset t38) (at_time jessica sunset t39)
    (at_time jessica sunset t40) (at_time jessica sunset t41) (at_time jessica sunset t42)
    (at_time jessica sunset t43) (at_time jessica sunset t44)
  )

  (:goal (and
    (met visitor jessica)
  ))
)