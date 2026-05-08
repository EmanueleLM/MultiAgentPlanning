(define (problem calendar_scheduling_example9_problem)
    (:domain calendar_scheduling_example9)
    (:objects
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time_point
        s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - meeting_slot
    )
    (:init
        ; Define time point ordering (9:00 to 17:00, 30 min intervals)
        (next-time-point t0 t1) (next-time-point t1 t2) (next-time-point t2 t3) (next-time-point t3 t4)
        (next-time-point t4 t5) (next-time-point t5 t6) (next-time-point t6 t7) (next-time-point t7 t8)
        (next-time-point t8 t9) (next-time-point t9 t10) (next-time-point t10 t11) (next-time-point t11 t12)
        (next-time-point t12 t13) (next-time-point t13 t14) (next-time-point t14 t15)

        ; Map meeting slots to their start time points
        (slot-starts-at s0 t0) (slot-starts-at s1 t1) (slot-starts-at s2 t2) (slot-starts-at s3 t3)
        (slot-starts-at s4 t4) (slot-starts-at s5 t5) (slot-starts-at s6 t6) (slot-starts-at s7 t7)
        (slot-starts-at s8 t8) (slot-starts-at s9 t9) (slot-starts-at s10 t10) (slot-starts-at s11 t11)
        (slot-starts-at s12 t12) (slot-starts-at s13 t13) (slot-starts-at s14 t14) (slot-starts-at s15 t15)

        ; Initialize availability based on busy schedules (only positive literals)
        ; Diane's available slots (derived from busy: t0, t6, t11, t12):
        (available-at diane t1)
        (available-at diane t2)
        (available-at diane t3)
        (available-at diane t4)
        (available-at diane t5)
        (available-at diane t7)
        (available-at diane t8)
        (available-at diane t9)
        (available-at diane t10)
        (available-at diane t13)
        (available-at diane t14)
        (available-at diane t15)

        ; Kelly's available slots (derived from busy: t1, t3):
        (available-at kelly t0)
        (available-at kelly t2)
        (available-at kelly t4)
        (available-at kelly t5)
        (available-at kelly t6)
        (available-at kelly t7)
        (available-at kelly t8)
        (available-at kelly t9)
        (available-at kelly t10)
        (available-at kelly t11)
        (available-at kelly t12)
        (available-at kelly t13)
        (available-at kelly t14)
        (available-at kelly t15)

        ; Deborah's available slots (derived from busy: t0, t2-t9, t11-t15):
        (available-at deborah t1)
        (available-at deborah t10)

        ; Initialize total cost for metric
        (= (total-cost) 0)

        ; Assign numerical costs to time points for 'earliest' preference
        (= (time-cost t0) 0)
        (= (time-cost t1) 1)
        (= (time-cost t2) 2)
        (= (time-cost t3) 3)
        (= (time-cost t4) 4)
        (= (time-cost t5) 5)
        (= (time-cost t6) 6)
        (= (time-cost t7) 7)
        (= (time-cost t8) 8)
        (= (time-cost t9) 9)
        (= (time-cost t10) 10)
        (= (time-cost t11) 11)
        (= (time-cost t12) 12)
        (= (time-cost t13) 13)
        (= (time-cost t14) 14)
        (= (time-cost t15) 15)
    )
    (:goal (scheduled-one-meeting))
    (:metric minimize (total-cost))