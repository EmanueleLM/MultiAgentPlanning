(define (problem schedule_example_38)
  (:domain calendar_scheduling)
  (:objects 
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - slot
  )
  (:init
    ;; Timeslot mapping (30-minute intervals from 9:00 to 17:00):
    ;; t1: 09:00-09:30, t2: 09:30-10:00, t3: 10:00-10:30, t4: 10:30-11:00
    ;; t5: 11:00-11:30, t6: 11:30-12:00, t7: 12:00-12:30, t8: 12:30-13:00
    ;; t9: 13:00-13:30, t10: 13:30-14:00, t11: 14:00-14:30, t12: 14:30-15:00
    ;; t13: 15:00-15:30, t14: 15:30-16:00, t15: 16:00-16:30, t16: 16:30-17:00

    ;; Catherine's Free Slots:
    ;; Busy: 10:30-11:00 (t4), 12:30-13:30 (t8, t9), 14:30-15:00 (t12)
    (free_catherine t1)
    (free_catherine t2)
    (free_catherine t3)
    (free_catherine t5)
    (free_catherine t6)
    (free_catherine t7)
    (free_catherine t10)
    (free_catherine t11)
    (free_catherine t13)
    (free_catherine t14)
    (free_catherine t15)
    (free_catherine t16)

    ;; Michael's Free Slots:
    ;; Busy: 09:30-10:30 (t2, t3), 12:00-13:00 (t7, t8), 13:30-14:00 (t10), 15:00-15:30 (t13)
    (free_michael t1)
    (free_michael t4)
    (free_michael t5)
    (free_michael t6)
    (free_michael t9)
    (free_michael t11)
    (free_michael t12)
    (free_michael t14)
    (free_michael t15)
    (free_michael t16)

    ;; Alexander's Free Slots:
    ;; Busy: 09:00-09:30 (t1), 10:00-10:30 (t3), 11:00-12:00 (t5, t6), 13:00-13:30 (t9), 14:00-16:00 (t11, t12, t13, t14), 16:30-17:00 (t16)
    (free_alexander t2)
    (free_alexander t4)
    (free_alexander t7)
    (free_alexander t8)
    (free_alexander t10)
    (free_alexander t15)
  )
  (:goal (meeting_scheduled))
)