(define (problem MeetingPlanningExample5-problem)
  (:domain MeetingPlanningExample5)
  (:objects
    traveler - agent
    nobhill thecastro - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 - tick
  )

  (:init
    ;; Initial current time: t0 = 09:00
    (current_time t0)

    ;; Discrete 15-minute tick succession from 09:00 to 15:00 (t0..t24)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4) (next t4 t5) (next t5 t6)
    (next t6 t7) (next t7 t8) (next t8 t9) (next t9 t10) (next t10 t11) (next t11 t12)
    (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16) (next t16 t17) (next t17 t18)
    (next t18 t19) (next t19 t20) (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24)

    ;; Starting location at 09:00
    (at traveler nobhill)

    ;; William's static location
    (william_here thecastro)

    ;; Known bidirectional route; both directions rounded up to 2 ticks in the discrete model
    (route2 nobhill thecastro)
    (route2 thecastro nobhill)

    ;; William is available starting at 12:15 = t13 and onward within planning horizon (t13..t23)
    ;; Tick mapping: t0=09:00, t1=09:15, ..., t12=12:00, t13=12:15, ...
    (can_meet_william t13) (can_meet_william t14) (can_meet_william t15)
    (can_meet_william t16) (can_meet_william t17) (can_meet_william t18)
    (can_meet_william t19) (can_meet_william t20) (can_meet_william t21)
    (can_meet_william t22) (can_meet_william t23)
  )

  ;; Goal: complete five contiguous meeting ticks (5 * 15 = 75 minutes) with William.
  (:goal (and (met_william5)))
)