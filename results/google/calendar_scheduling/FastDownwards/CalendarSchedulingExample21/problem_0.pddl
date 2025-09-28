(define (problem schedule-monday-09-17)
  (:domain schedule-meeting)

  ; Timeslots represent 30-minute start times from 09:00 to 16:30:
  ; t0=09:00, t1=09:30, t2=10:00, t3=10:30, t4=11:00, t5=11:30,
  ; t6=12:00, t7=12:30, t8=13:00, t9=13:30, t10=14:00, t11=14:30,
  ; t12=15:00, t13=15:30, t14=16:00, t15=16:30

  (:objects
    sara sarah shirley harold terry - participant
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
  )

  (:init
    ; Sara: "I have no meetings on Monday between 09:00 and 17:00" -> free all slots
    (free sara t0) (free sara t1) (free sara t2) (free sara t3)
    (free sara t4) (free sara t5) (free sara t6) (free sara t7)
    (free sara t8) (free sara t9) (free sara t10) (free sara t11)
    (free sara t12) (free sara t13) (free sara t14) (free sara t15)

    ; Sarah: busy 12:00-12:30 (t6) and 15:00-15:30 (t12) -> free all other slots
    (free sarah t0) (free sarah t1) (free sarah t2) (free sarah t3)
    (free sarah t4) (free sarah t5)               (free sarah t7)
    (free sarah t8) (free sarah t9) (free sarah t10) (free sarah t11)
    (free sarah t13) (free sarah t14) (free sarah t15)

    ; Shirley: busy 13:30-14:00 (t9) and 14:30-15:00 (t11) -> free others
    (free shirley t0) (free shirley t1) (free shirley t2) (free shirley t3)
    (free shirley t4) (free shirley t5) (free shirley t6) (free shirley t7)
    (free shirley t8)               (free shirley t10)               (free shirley t12)
    (free shirley t13) (free shirley t14) (free shirley t15)

    ; Harold: busy 09:00-10:00 (t0,t1), 10:30-12:30 (t3,t4,t5,t6), 13:00-17:00 (t8..t15)
    ; Therefore free only t2 and t7
    (free harold t2) (free harold t7)

    ; Terry: busy 09:00-10:00 (t0,t1), 10:30-11:30 (t3,t4), 12:00-17:00 (t6..t15)
    ; Therefore free only t2 and t5
    (free terry t2) (free terry t5)
  )

  ; Goal: schedule the single 30-minute meeting at the earliest common available start time.
  ; The earliest common free slot across all participants is t2 (10:00).
  (:goal (scheduled t2))
)