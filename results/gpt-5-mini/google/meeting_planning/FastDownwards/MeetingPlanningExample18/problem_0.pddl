(define (problem meeting-problem)
  (:domain meeting-domain)
  ;; Comments describing the chosen schedule and interpretation:
  ;; - Time unit: 1 time-slot = 5 minutes.
  ;; - Travel duration from home -> betty_loc = 6 slots = 30 minutes.
  ;; - Required contiguous meeting duration = 15 slots = 75 minutes.
  ;; - Betty availability window: slot 18 (90 min) through slot 48 (240 min).
  ;; Chosen feasible schedule (one valid example the planner may find):
  ;;   - depart home at t27, arrive betty_loc at t33 (6-slot travel)
  ;;   - start meeting at t33, finish at t48 (15-slot meeting ends exactly at availability end)
  ;; This comment documents the schedule integrated from candidate planning and auditor constraints.
  (:objects
    traveler betty - agent
    home betty_loc - loc
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20
    t21 t22 t23 t24 t25 t26 t27 t28 t29 t30 t31 t32 t33 t34 t35 t36 t37 t38 t39
    t40 t41 t42 t43 t44 t45 t46 t47 t48 t49 t50 t51 t52 t53 t54 t55 t56 t57 t58 t59 t60 - time
  )

  (:init
    ;; Initial time
    (current-time t0)

    ;; Initial locations
    (at traveler home)
    (at betty betty_loc)

    ;; delta1 relations (one-slot successor) for advancing time by 1 slot (5 min).
    (delta1 t0 t1) (delta1 t1 t2) (delta1 t2 t3) (delta1 t3 t4) (delta1 t4 t5)
    (delta1 t5 t6) (delta1 t6 t7) (delta1 t7 t8) (delta1 t8 t9) (delta1 t9 t10)
    (delta1 t10 t11) (delta1 t11 t12) (delta1 t12 t13) (delta1 t13 t14) (delta1 t14 t15)
    (delta1 t15 t16) (delta1 t16 t17) (delta1 t17 t18) (delta1 t18 t19) (delta1 t19 t20)
    (delta1 t20 t21) (delta1 t21 t22) (delta1 t22 t23) (delta1 t23 t24) (delta1 t24 t25)
    (delta1 t25 t26) (delta1 t26 t27) (delta1 t27 t28) (delta1 t28 t29) (delta1 t29 t30)
    (delta1 t30 t31) (delta1 t31 t32) (delta1 t32 t33) (delta1 t33 t34) (delta1 t34 t35)
    (delta1 t35 t36) (delta1 t36 t37) (delta1 t37 t38) (delta1 t38 t39) (delta1 t39 t40)
    (delta1 t40 t41) (delta1 t41 t42) (delta1 t42 t43) (delta1 t43 t44) (delta1 t44 t45)
    (delta1 t45 t46) (delta1 t46 t47) (delta1 t47 t48) (delta1 t48 t49) (delta1 t49 t50)
    (delta1 t50 t51) (delta1 t51 t52) (delta1 t52 t53) (delta1 t53 t54) (delta1 t54 t55)
    (delta1 t55 t56) (delta1 t56 t57) (delta1 t57 t58) (delta1 t58 t59) (delta1 t59 t60)

    ;; delta6 relations for travel duration (6 slots = 30 minutes).
    (delta6 t0 t6) (delta6 t1 t7) (delta6 t2 t8) (delta6 t3 t9) (delta6 t4 t10)
    (delta6 t5 t11) (delta6 t6 t12) (delta6 t7 t13) (delta6 t8 t14) (delta6 t9 t15)
    (delta6 t10 t16) (delta6 t11 t17) (delta6 t12 t18) (delta6 t13 t19) (delta6 t14 t20)
    (delta6 t15 t21) (delta6 t16 t22) (delta6 t17 t23) (delta6 t18 t24) (delta6 t19 t25)
    (delta6 t20 t26) (delta6 t21 t27) (delta6 t22 t28) (delta6 t23 t29) (delta6 t24 t30)
    (delta6 t25 t31) (delta6 t26 t32) (delta6 t27 t33) (delta6 t28 t34) (delta6 t29 t35)
    (delta6 t30 t36) (delta6 t31 t37) (delta6 t32 t38) (delta6 t33 t39) (delta6 t34 t40)
    (delta6 t35 t41) (delta6 t36 t42) (delta6 t37 t43) (delta6 t38 t44) (delta6 t39 t45)
    (delta6 t40 t46) (delta6 t41 t47) (delta6 t42 t48) (delta6 t43 t49) (delta6 t44 t50)
    (delta6 t45 t51) (delta6 t46 t52) (delta6 t47 t53) (delta6 t48 t54) (delta6 t49 t55)
    (delta6 t50 t56) (delta6 t51 t57) (delta6 t52 t58) (delta6 t53 t59) (delta6 t54 t60)

    ;; delta15 relations for meeting duration (15 slots = 75 minutes).
    (delta15 t0 t15) (delta15 t1 t16) (delta15 t2 t17) (delta15 t3 t18) (delta15 t4 t19)
    (delta15 t5 t20) (delta15 t6 t21) (delta15 t7 t22) (delta15 t8 t23) (delta15 t9 t24)
    (delta15 t10 t25) (delta15 t11 t26) (delta15 t12 t27) (delta15 t13 t28) (delta15 t14 t29)
    (delta15 t15 t30) (delta15 t16 t31) (delta15 t17 t32) (delta15 t18 t33) (delta15 t19 t34)
    (delta15 t20 t35) (delta15 t21 t36) (delta15 t22 t37) (delta15 t23 t38) (delta15 t24 t39)
    (delta15 t25 t40) (delta15 t26 t41) (delta15 t27 t42) (delta15 t28 t43) (delta15 t29 t44)
    (delta15 t30 t45) (delta15 t31 t46) (delta15 t32 t47) (delta15 t33 t48) (delta15 t34 t49)
    (delta15 t35 t50) (delta15 t36 t51) (delta15 t37 t52) (delta15 t38 t53) (delta15 t39 t54)
    (delta15 t40 t55) (delta15 t41 t56) (delta15 t42 t57) (delta15 t43 t58) (delta15 t44 t59)
    (delta15 t45 t60)

    ;; Betty availability window must fully contain the meeting interval.
    ;; Betty is available from slot 18 through slot 48 (inclusive of start; meeting must end by t48).
    ;; Therefore any (start,end) that equals (ti, ti+15) with i in 18..33 is allowable.
    (available-betty t18 t33) (available-betty t19 t34) (available-betty t20 t35) (available-betty t21 t36)
    (available-betty t22 t37) (available-betty t23 t38) (available-betty t24 t39) (available-betty t25 t40)
    (available-betty t26 t41) (available-betty t27 t42) (available-betty t28 t43) (available-betty t29 t44)
    (available-betty t30 t45) (available-betty t31 t46) (available-betty t32 t47) (available-betty t33 t48)
  )

  ;; Goal: the traveler must have completed a contiguous meeting of at least 75 minutes with Betty.
  ;; The met-traveler predicate is set only by the meet-with-betty action which enforces:
  ;;  - meeting duration = 15 slots (75 minutes),
  ;;  - the entire meeting interval is within Betty's availability (available-betty),
  ;;  - traveler is present at betty_loc for the whole meeting interval (meeting action does not change location).
  (:goal (and
    (met-traveler traveler)
  ))
)