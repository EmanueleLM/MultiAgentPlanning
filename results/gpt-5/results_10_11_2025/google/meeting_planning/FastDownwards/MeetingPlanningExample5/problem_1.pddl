(define (problem MeetingPlanningExample5)
  (:domain sf_meeting_discrete)

  (:objects
    me - agent
    NobHill TheCastro - location
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18 t19 t20 t21 t22 t23 t24 - tick
  )

  (:init
    ; Initial position and time
    (at me NobHill)
    (current_time t0)

    ; Travel durations (rounded up to 2 ticks each way)
    (travel_ticks2 NobHill TheCastro)
    (travel_ticks2 TheCastro NobHill)

    ; Successor relation for 15-minute ticks from 09:00 (t0) to 15:00 (t24)
    (next t0 t1)  (next t1 t2)  (next t2 t3)  (next t3 t4)  (next t4 t5)
    (next t5 t6)  (next t6 t7)  (next t7 t8)  (next t8 t9)  (next t9 t10)
    (next t10 t11) (next t11 t12) (next t12 t13) (next t13 t14) (next t14 t15)
    (next t15 t16) (next t16 t17) (next t17 t18) (next t18 t19) (next t19 t20)
    (next t20 t21) (next t21 t22) (next t22 t23) (next t23 t24)

    ; William's availability within the horizon: from 12:15 (t13) onward
    (can_meet_william t13)
    (can_meet_william t14)
    (can_meet_william t15)
    (can_meet_william t16)
    (can_meet_william t17)
    (can_meet_william t18)
    (can_meet_william t19)
    (can_meet_william t20)
    (can_meet_william t21)
    (can_meet_william t22)
    (can_meet_william t23)
    (can_meet_william t24)
  )

  (:goal
    (met_william_5ticks)
  )
)