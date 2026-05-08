(define (problem calendar_scheduling_example_2)
  (:domain calendar_scheduling)
  (:objects
    t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - timeslot
  )
  (:init
    ;; Roy's existing schedule constraints:
    ;; Blocked: 9:00-9:30 (t1), 10:00-10:30 (t3), 11:00-11:30 (t5), 12:30-13:00 (t8)
    (available roy t2)
    (available roy t4)
    (available roy t6)
    (available roy t7)
    (available roy t9)
    (available roy t10)
    (available roy t11)
    (available roy t12)
    (available roy t13)
    (available roy t14)
    (available roy t15)
    (available roy t16)

    ;; Kathryn's existing schedule constraints:
    ;; Blocked: 9:30-10:00 (t2), 16:30-17:00 (t16)
    (available kathryn t1)
    (available kathryn t3)
    (available kathryn t4)
    (available kathryn t5)
    (available kathryn t6)
    (available kathryn t7)
    (available kathryn t8)
    (available kathryn t9)
    (available kathryn t10)
    (available kathryn t11)
    (available kathryn t12)
    (available kathryn t13)
    (available kathryn t14)
    (available kathryn t15)

    ;; Amy's existing schedule constraints:
    ;; Blocked: 9:00-14:30 (t1-t11), 15:00-16:00 (t13, t14), 16:30-17:00 (t16)
    ;; Preference constraint: rather not meet after 15:30 (t14 starts at 15:30, t15 starts at 16:00)
    ;; Slot t12 (14:30-15:00) is free and respects preference.
    ;; Slot t15 (16:00-16:30) is free but violates preference.
    (available amy t12)
  )
  (:goal
    (meeting_scheduled)
  )
)