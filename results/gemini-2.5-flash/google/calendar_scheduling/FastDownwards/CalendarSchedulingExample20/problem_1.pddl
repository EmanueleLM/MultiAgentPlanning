(define (problem calendar-scheduling-example-20)
    (:domain calendar-scheduling)
    (:objects
        ralph peter daniel - person
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - timeslot
    )
    (:init
        ; Timeslot mapping:
        ; t0: 09:00-09:30, t1: 09:30-10:00, t2: 10:00-10:30, t3: 10:30-11:00
        ; t4: 11:00-11:30, t5: 11:30-12:00, t6: 12:00-12:30, t7: 12:30-13:00
        ; t8: 13:00-13:30, t9: 13:30-14:00, t10: 14:00-14:30, t11: 14:30-15:00
        ; t12: 15:00-15:30, t13: 15:30-16:00, t14: 16:00-16:30, t15: 16:30-17:00

        ; Ralph's schedule: busy 13:30-14:00 (t9), 14:30-15:00 (t11)
        (available ralph t0) (available ralph t1) (available ralph t2) (available ralph t3)
        (available ralph t4) (available ralph t5) (available ralph t6) (available ralph t7)
        (available ralph t8)
        (available ralph t10)
        (available ralph t12) (available ralph t13) (available ralph t14) (available ralph t15)

        ; Peter's schedule: busy 9:00-9:30 (t0), 11:00-13:00 (t4, t5, t6, t7), 16:00-16:30 (t14)
        (available peter t1) (available peter t2) (available peter t3)
        (available peter t8) (available peter t9) (available peter t10) (available peter t11)
        (available peter t12) (available peter t13)
        (available peter t15)

        ; Daniel's schedule: busy 9:00-10:00 (t0, t1), 10:30-15:30 (t3-t12), 16:00-17:00 (t14, t15)
        ; Daniel's preference: avoid after 13:30 (t9-t15).
        ; Combining busy slots and preference (treated as hard constraint for feasibility):
        ; Effectively, Daniel is only available at t2 (10:00-10:30).
        (available daniel t2)
    )
    (:goal (exists (?t - timeslot) (meeting_scheduled ?t)))
)