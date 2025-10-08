(define (problem CalendarSchedulingExample25-problem)
  (:domain CalendarSchedulingExample25)
  (:objects
    julia joshua nicholas david melissa - participant
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )
  (:init
    ; Julia available start times: 09:00..16:30 except 10:30,11:00,12:00,13:00,14:00,15:00
    (avail julia t0) (avail julia t1) (avail julia t2) (avail julia t5) (avail julia t7)
    (avail julia t9) (avail julia t11) (avail julia t13) (avail julia t14) (avail julia t15)

    ; Joshua: free all slots
    (avail joshua t0) (avail joshua t1) (avail joshua t2) (avail joshua t3)
    (avail joshua t4) (avail joshua t5) (avail joshua t6) (avail joshua t7)
    (avail joshua t8) (avail joshua t9) (avail joshua t10) (avail joshua t11)
    (avail joshua t12) (avail joshua t13) (avail joshua t14) (avail joshua t15)

    ; Nicholas available: all except 09:00,12:00,15:30-16:30 start slots (t0,t6,t13,t14)
    (avail nicholas t1) (avail nicholas t2) (avail nicholas t3) (avail nicholas t4)
    (avail nicholas t5) (avail nicholas t7) (avail nicholas t8) (avail nicholas t9)
    (avail nicholas t10) (avail nicholas t11) (avail nicholas t12) (avail nicholas t15)

    ; David available: {t4,t5,t7,t9,t12,t13}
    (avail david t4) (avail david t5) (avail david t7)
    (avail david t9) (avail david t12) (avail david t13)

    ; Melissa available: {t1,t2,t3,t4,t5,t6,t8,t12}
    (avail melissa t1) (avail melissa t2) (avail melissa t3) (avail melissa t4)
    (avail melissa t5) (avail melissa t6) (avail melissa t8) (avail melissa t12)
  )
  (:goal (scheduled))
)