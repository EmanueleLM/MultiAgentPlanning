(define (problem calendar-scheduling-example14)
    (:domain calendar-scheduling)
    (:objects
        brandon jerry bradley - agent
        s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - timeslot
    )
    (:init
        (= (total-cost) 0)

        ; Brandon's availability (9:00-17:00, 30-min slots)
        ; Schedule: Monday 13:00-14:00 (s8, s9), 15:30-16:00 (s13), 16:30-17:00 (s15)
        ; Unavailable: s8, s9, s13, s15
        (available brandon s0) (available brandon s1) (available brandon s2) (available brandon s3)
        (available brandon s4) (available brandon s5) (available brandon s6) (available brandon s7)
        (available brandon s10) (available brandon s11) (available brandon s12) (available brandon s14)

        ; Jerry's availability
        ; Schedule: No meetings the whole day (Monday 9:00 to 17:00)
        ; Available for all slots
        (available jerry s0) (available jerry s1) (available jerry s2) (available jerry s3)
        (available jerry s4) (available jerry s5) (available jerry s6) (available jerry s7)
        (available jerry s8) (available jerry s9) (available jerry s10) (available jerry s11)
        (available jerry s12) (available jerry s13) (available jerry s14) (available jerry s15)

        ; Bradley's availability
        ; Schedule: Monday 9:00-11:30 (s0, s1, s2, s3, s4), 12:00-15:00 (s6, s7, s8, s9, s10, s11), 16:00-16:30 (s14)
        ; Unavailable: s0, s1, s2, s3, s4, s6, s7, s8, s9, s10, s11, s14
        (available bradley s5) (available bradley s12) (available bradley s13) (available bradley s15)

        ; Brandon's preference: Avoid meetings before 14:30.
        ; 14:30 corresponds to slot s11. So s11, s12, s13, s14, s15 are preferred.
        (slot-is-after-preference s11)
        (slot-is-after-preference s12)
        (slot-is-after-preference s13)
        (slot-is-after-preference s14)
        (slot-is-after-preference s15)
    )
    (:goal (exists (?s - timeslot) (meeting-scheduled ?s)))
    (:metric minimize (total-cost))
)