(define (problem orchestrate-schedule-monday)
  (:domain orchestrated-scheduling)

  ; Canonical slots t0..t15 map to 09:00..16:30 in 30-min increments:
  ; t0=09:00, t1=09:30, t2=10:00, t3=10:30, t4=11:00, t5=11:30,
  ; t6=12:00, t7=12:30, t8=13:00, t9=13:30, t10=14:00, t11=14:30,
  ; t12=15:00, t13=15:30, t14=16:00, t15=16:30

  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - slot
  )

  (:init
    ; worktime: all slots between 09:00-17:00
    (worktime t0) (worktime t1) (worktime t2) (worktime t3)
    (worktime t4) (worktime t5) (worktime t6) (worktime t7)
    (worktime t8) (worktime t9) (worktime t10) (worktime t11)
    (worktime t12) (worktime t13) (worktime t14) (worktime t15)

    ; consecutive 30-minute relations
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4)
    (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8)
    (next t8 t9) (next t9 t10) (next t10 t11) (next t11 t12)
    (next t12 t13) (next t13 t14) (next t14 t15)

    ; --- Billy's known busy slots (from Billy's problem)
    ; Busy Monday 11:30-12:00 -> t5
    ; Busy Monday 13:00-15:00 -> t8,t9,t10,t11
    ; Busy Monday 16:00-16:30 -> t14
    (busy_billy t5)
    (busy_billy t8) (busy_billy t9) (busy_billy t10) (busy_billy t11)
    (busy_billy t14)

    ; --- Maria's free slots (mapped from her names to t0..t15)
    ; Maria listed busy: 09:00 (t0), 10:00 (t2), 13:00 (t8), 14:00 (t10)
    ; She declared free the remaining listed slots:
    (free_maria t1)  ; 09:30
    (free_maria t3)  ; 10:30
    (free_maria t4)  ; 11:00
    (free_maria t5)  ; 11:30
    (free_maria t6)  ; 12:00
    (free_maria t7)  ; 12:30
    (free_maria t9)  ; 13:30
    (free_maria t11) ; 14:30
    (free_maria t12) ; 15:00
    (free_maria t13) ; 15:30
    (free_maria t14) ; 16:00
    (free_maria t15) ; 16:30

    ; --- William's available slots (mapped from his slot0..slot15)
    ; William marked available: slot0, slot2, slot3, slot4, slot5, slot7, slot8, slot12
    (available_william t0)
    (available_william t2)
    (available_william t3)
    (available_william t4)
    (available_william t5)
    (available_william t7)
    (available_william t8)
    (available_william t12)
  )

  ; Global goal: schedule a 60-minute meeting (2 consecutive 30-min slots) that fits everyone's calendars.
  (:goal (meeting-scheduled))
)