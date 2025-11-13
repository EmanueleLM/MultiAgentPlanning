(define (problem meet-margaret-problem)
  (:domain meet-margaret-sf)
  (:objects
    mission_district haight_ashbury - location
    ;; timepoints t0 .. t42 (t0 = 09:00, t42 = 09:42) sufficient for the earliest feasible plan
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9
    t10 t11 t12 t13 t14 t15 t16 t17 t18 t19
    t20 t21 t22 t23 t24 t25 t26 t27 t28 t29
    t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 - time
  )
  (:init
    ;; initial time and location
    (current-time t0)
    (at mission_district)

    ;; successor chain next(ti, ti+1) for i = 0..41 (only the needed horizon)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5)
    (next t5 t6) (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24) (next t24 t25)
    (next t25 t26) (next t26 t27) (next t27 t28) (next t28 t29) (next t29 t30)
    (next t30 t31) (next t31 t32) (next t32 t33) (next t33 t34) (next t34 t35)
    (next t35 t36) (next t36 t37) (next t37 t38) (next t38 t39) (next t39 t40)
    (next t40 t41) (next t41 t42)

    ;; Margaret's availability is true for the entire (used) planning horizon
    (available-margaret)

    ;; numeric initialization
    (= (total-cost) 0)
  )
  (:goal (and (met_margaret_30)))
  (:metric minimize (total-cost))
)