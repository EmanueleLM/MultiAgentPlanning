(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    traveler - agent
    fishermans_wharf nob_hill - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 - time
  )

  (:init
    (at traveler fishermans_wharf t0)

    (free traveler t0) (free traveler t1) (free traveler t2) (free traveler t3) (free traveler t4)
    (free traveler t5) (free traveler t6) (free traveler t7) (free traveler t8) (free traveler t9)
    (free traveler t10) (free traveler t11) (free traveler t12) (free traveler t13) (free traveler t14)
    (free traveler t15) (free traveler t16) (free traveler t17) (free traveler t18) (free traveler t19)
    (free traveler t20) (free traveler t21) (free traveler t22) (free traveler t23) (free traveler t24)
    (free traveler t25) (free traveler t26) (free traveler t27) (free traveler t28) (free traveler t29)
    (free traveler t30) (free traveler t31) (free traveler t32) (free traveler t33) (free traveler t34)
    (free traveler t35) (free traveler t36) (free traveler t37) (free traveler t38) (free traveler t39)
    (free traveler t40) (free traveler t41) (free traveler t42) (free traveler t43)

    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25)
    (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30)
    (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35)
    (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40)
    (next t40 t41) (next t41 t42) (next t42 t43)

    (kenneth_available t21) (kenneth_available t22) (kenneth_available t23)
    (kenneth_available t24) (kenneth_available t25) (kenneth_available t26)
    (kenneth_available t27) (kenneth_available t28) (kenneth_available t29)
    (kenneth_available t30) (kenneth_available t31) (kenneth_available t32)
    (kenneth_available t33) (kenneth_available t34) (kenneth_available t35)
    (kenneth_available t36) (kenneth_available t37) (kenneth_available t38)
    (kenneth_available t39) (kenneth_available t40) (kenneth_available t41)
    (kenneth_available t42) (kenneth_available t43)

    (kenneth_at nob_hill)
  )

  (:goal (and
    (met90)
  ))
)