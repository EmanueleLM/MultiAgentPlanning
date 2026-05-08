(define (problem calendar_scheduling_example9_problem)
    (:domain calendar_scheduling_example9)
    (:objects
        diane kelly deborah - person
        t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time_point
        s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - meeting_slot
    )
    (:init
        ; Define time point ordering (9:00 to 17:00, 30 min intervals)
        (next-time-point t0 t1) (next-time-point t1 t2) (next-time-point t2 t3) (next-time-point t3 t4)
        (next-time-point t4 t5) (next-time-point t5 t6) (next-time-point t6 t7) (next-time-point t7 t8)
        (next-time-point t8 t9) (next-time-point t9 t10) (next-time-point t10 t11) (next-time-point t11 t12)
        (next-time-point t12 t13) (next-time-point t13 t14) (next-time-point t14 t15) (next-time-point t15 t16)

        ; Map meeting slots to their start time points
        (slot-starts-at s0 t0) (slot-starts-at s1 t1) (slot-starts-at s2 t2) (slot-starts-at s3 t3)
        (slot-starts-at s4 t4) (slot-starts-at s5 t5) (slot-starts-at s6 t6) (slot-starts-at s7 t7)
        (slot-starts-at s8 t8) (slot-starts-at s9 t9) (slot-starts-at s10 t10) (slot-starts-at s11 t11)
        (slot-starts-at s12 t12) (slot-starts-at s13 t13) (slot-starts-at s14 t14) (slot-starts-at s15 t15)

        ; Initialize all persons as available for all potential 30-min meeting slots
        (available-at diane t0) (available-at diane t1) (available-at diane t2) (available-at diane t3)
        (available-at diane t4) (available-at diane t5) (available-at diane t6) (available-at diane t7)
        (available-at diane t8) (available-at diane t9) (available-at diane t10) (available-at diane t11)
        (available-at diane t12) (available-at diane t13) (available-at diane t14) (available-at diane t15)

        (available-at kelly t0) (available-at kelly t1) (available-at kelly t2) (available-at kelly t3)
        (available-at kelly t4) (available-at kelly t5) (available-at kelly t6) (available-at kelly t7)
        (available-at kelly t8) (available-at kelly t9) (available-at kelly t10) (available-at kelly t11)
        (available-at kelly t12) (available-at kelly t13) (available-at kelly t14) (available-at kelly t15)

        (available-at deborah t0) (available-at deborah t1) (available-at deborah t2) (available-at deborah t3)
        (available-at deborah t4) (available-at deborah t5) (available-at deborah t6) (available-at deborah t7)
        (available-at deborah t8) (available-at deborah t9) (available-at deborah t10) (available-at deborah t11)
        (available-at deborah t12) (available-at deborah t13) (available-at deborah t14) (available-at deborah t15)

        ; Override availability based on busy schedules (using negative preconditions)

        ; Diane's busy slots: 9:00-9:30, 12:00-12:30, 14:30-15:30
        (not (available-at diane t0))  ; 9:00-9:30
        (not (available-at diane t6))  ; 12:00-12:30
        (not (available-at diane t11)) ; 14:30-15:00
        (not (available-at diane t12)) ; 15:00-15:30

        ; Kelly's busy slots: 9:30-10:00, 10:30-11:00
        (not (available-at kelly t1))  ; 9:30-10:00
        (not (available-at kelly t3))  ; 10:30-11:00

        ; Deborah's busy slots: 9:00-9:30, 10:00-14:00, 14:30-17:00
        (not (available-at deborah t0))  ; 9:00-9:30
        (not (available-at deborah t2))  ; 10:00-10:30
        (not (available-at deborah t3))  ; 10:30-11:00
        (not (available-at deborah t4))  ; 11:00-11:30
        (not (available-at deborah t5))  ; 11:30-12:00
        (not (available-at deborah t6))  ; 12:00-12:30
        (not (available-at deborah t7))  ; 12:30-13:00
        (not (available-at deborah t8))  ; 13:00-13:30
        (not (available-at deborah t9))  ; 13:30-14:00
        (not (available-at deborah t11)) ; 14:30-15:00
        (not (available-at deborah t12)) ; 15:00-15:30
        (not (available-at deborah t13)) ; 15:30-16:00
        (not (available-at deborah t14)) ; 16:00-16:30
        (not (available-at deborah t15)) ; 16:30-17:00
    )
    (:goal (exists (?s - meeting_slot) (meeting-scheduled ?s)))
)