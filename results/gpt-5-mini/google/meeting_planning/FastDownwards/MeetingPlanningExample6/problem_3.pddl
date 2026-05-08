(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    tourist - agent
    fishermans_wharf nob_hill - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 - time
  )

  (:init
    (at tourist fishermans_wharf t0)

    (free tourist t0) (free tourist t1) (free tourist t2) (free tourist t3) (free tourist t4)
    (free tourist t5) (free tourist t6) (free tourist t7) (free tourist t8) (free tourist t9)
    (free tourist t10) (free tourist t11) (free tourist t12) (free tourist t13) (free tourist t14)
    (free tourist t15) (free tourist t16) (free tourist t17) (free tourist t18) (free tourist t19)
    (free tourist t20) (free tourist t21) (free tourist t22) (free tourist t23) (free tourist t24)
    (free tourist t25) (free tourist t26) (free tourist t27) (free tourist t28) (free tourist t29)
    (free tourist t30) (free tourist t31) (free tourist t32) (free tourist t33) (free tourist t34)
    (free tourist t35) (free tourist t36) (free tourist t37) (free tourist t38) (free tourist t39)
    (free tourist t40) (free tourist t41) (free tourist t42) (free tourist t43)

    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25)
    (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30)
    (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35)
    (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40)
    (next t40 t41) (next t41 t42) (next t42 t43)

    ;; Kenneth is available from 14:15 (t21) through 19:30 (t42).  A 90-min (6-slot) meeting may start as late as t37.
    (kenneth_available t21) (kenneth_available t22) (kenneth_available t23)
    (kenneth_available t24) (kenneth_available t25) (kenneth_available t26)
    (kenneth_available t27) (kenneth_available t28) (kenneth_available t29)
    (kenneth_available t30) (kenneth_available t31) (kenneth_available t32)
    (kenneth_available t33) (kenneth_available t34) (kenneth_available t35)
    (kenneth_available t36) (kenneth_available t37) (kenneth_available t38)
    (kenneth_available t39) (kenneth_available t40) (kenneth_available t41)
    (kenneth_available t42)
  )

  (:goal (and
    (met90)
  ))
)