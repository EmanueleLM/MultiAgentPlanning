(define (problem meet_mary_75min)
  (:domain meeting_planning)
  (:objects
    traveler mary - agent
    union_square nob_hill - loc
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 t25 t26 t27 t28 t29 - time
  )

  (:init
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25)
    (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29)

    (at traveler union_square t0)

    (at mary nob_hill t12) (at mary nob_hill t13) (at mary nob_hill t14)
    (at mary nob_hill t15) (at mary nob_hill t16) (at mary nob_hill t17)
    (at mary nob_hill t18) (at mary nob_hill t19) (at mary nob_hill t20)
    (at mary nob_hill t21) (at mary nob_hill t22) (at mary nob_hill t23)
    (at mary nob_hill t24) (at mary nob_hill t25) (at mary nob_hill t26)
    (at mary nob_hill t27) (at mary nob_hill t28) (at mary nob_hill t29)
  )

  (:goal
    (met_mary)
  )
)