(define (problem schedule_46)
  (:domain calendar_scheduling)
  (:objects
    arthur theresa carl - person
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )
  (:init
    ;; t1=09:00, t2=09:30, t3=10:00, t4=10:30, t5=11:00, t6=11:30, t7=12:00, t8=12:30
    ;; t9=13:00, t10=13:30, t11=14:00, t12=14:30, t13=15:00, t14=15:30, t15=16:00, t16=16:30

    ;; Arthur busy: 9:30-10:00 (t2), 14:00-14:30 (t11)
    (available arthur t1)
    (available arthur t3)
    (available arthur t4)
    (available arthur t5)
    (available arthur t6)
    (available arthur t7)
    (available arthur t8)
    (available arthur t9)
    (available arthur t10)
    (available arthur t12)
    (available arthur t13)
    (available arthur t14)
    (available arthur t15)
    (available arthur t16)

    ;; Theresa busy: 9:00-9:30 (t1), 12:00-13:00 (t7, t8), 15:00-16:30 (t13, t14, t15)
    (available theresa t2)
    (available theresa t3)
    (available theresa t4)
    (available theresa t5)
    (available theresa t6)
    (available theresa t9)
    (available theresa t10)
    (available theresa t11)
    (available theresa t12)
    (available theresa t16)

    ;; Carl busy: 9:00-11:30 (t1, t2, t3, t4, t5), 12:00-14:00 (t7, t8, t9, t10), 14:30-17:00 (t12, t13, t14, t15, t16)
    (available carl t6)
    (available carl t11)
  )
  (:goal (meeting_scheduled))
)