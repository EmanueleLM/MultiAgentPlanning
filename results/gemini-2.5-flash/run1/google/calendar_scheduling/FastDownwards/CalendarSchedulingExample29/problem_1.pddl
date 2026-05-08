(define (problem calendar_scheduling_example_29)
    (:domain calendar_scheduling)
    (:objects
        madison diana shirley - person
        s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - time_slot
    )
    (:init
        ; Define next_slot relations for 30-minute intervals
        ; s0 = 9:00-9:30, s1 = 9:30-10:00, ..., s15 = 16:30-17:00
        (next_slot s0 s1)
        (next_slot s1 s2)
        (next_slot s2 s3)
        (next_slot s3 s4)
        (next_slot s4 s5)
        (next_slot s5 s6)
        (next_slot s6 s7)
        (next_slot s7 s8)
        (next_slot s8 s9)
        (next_slot s9 s10)
        (next_slot s10 s11)
        (next_slot s11 s12)
        (next_slot s12 s13)
        (next_slot s13 s14)
        (next_slot s14 s15)

        ; Madison's busy slots:
        ; 9:30 to 10:00 -> s1
        ; 11:30 to 12:00 -> s5
        (is_busy madison s1)
        (is_busy madison s5)

        ; Diana's busy slots:
        ; 11:00 to 11:30 -> s4
        ; 13:00 to 13:30 -> s8
        (is_busy diana s4)
        (is_busy diana s8)

        ; Shirley's busy slots:
        ; 9:00 to 12:00 -> s0, s1, s2, s3, s4, s5
        ; 13:30 to 15:00 -> s9, s10, s11
        ; 15:30 to 17:00 -> s13, s14, s15
        (is_busy shirley s0)
        (is_busy shirley s1)
        (is_busy shirley s2)
        (is_busy shirley s3)
        (is_busy shirley s4)
        (is_busy shirley s5)
        (is_busy shirley s9)
        (is_busy shirley s10)
        (is_busy shirley s11)
        (is_busy shirley s13)
        (is_busy shirley s14)
        (is_busy shirley s15)
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled_at ?s)))
)