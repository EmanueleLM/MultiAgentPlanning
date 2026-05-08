(define (problem calendar-scheduling-example14)
    (:domain calendar-scheduling)
    (:objects
        BRANDON JERRY BRADLEY - agent
        s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - timeslot
    )
    (:init
        (= (total-cost) 0)

        ; BRANDON's availability (9:00-17:00, 30-min slots)
        ; Schedule: Monday 13:00-14:00 (s8, s9), 15:30-16:00 (s13), 16:30-17:00 (s15)
        ; Unavailable: s8, s9, s13, s15
        (available BRANDON s0) (available BRANDON s1) (available BRANDON s2) (available BRANDON s3)
        (available BRANDON s4) (available BRANDON s5) (available BRANDON s6) (available BRANDON s7)
        (available BRANDON s10) (available BRANDON s11) (available BRANDON s12) (available BRANDON s14)

        ; JERRY's availability
        ; Schedule: No meetings the whole day (Monday 9:00 to 17:00)
        ; Available for all slots
        (available JERRY s0) (available JERRY s1) (available JERRY s2) (available JERRY s3)
        (available JERRY s4) (available JERRY s5) (available JERRY s6) (available JERRY s7)
        (available JERRY s8) (available JERRY s9) (available JERRY s10) (available JERRY s11)
        (available JERRY s12) (available JERRY s13) (available JERRY s14) (available JERRY s15)

        ; BRADLEY's availability
        ; Schedule: Monday 9:00-11:30 (s0, s1, s2, s3, s4), 12:00-15:00 (s6, s7, s8, s9, s10, s11), 16:00-16:30 (s14)
        ; Unavailable: s0, s1, s2, s3, s4, s6, s7, s8, s9, s10, s11, s14
        (available BRADLEY s5) (available BRADLEY s12) (available BRADLEY s13) (available BRADLEY s15)

        ; BRANDON's preference: Avoid meetings before 14:30.
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