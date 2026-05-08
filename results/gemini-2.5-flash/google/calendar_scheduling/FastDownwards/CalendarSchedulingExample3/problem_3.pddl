(define (problem calendar_scheduling_example3)
    (:domain calendar_scheduling)
    (:objects
        arthur michael samantha - person
        t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
        t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
    )
    (:init
        ; Next slot relations (each slot represents a 30-minute interval)
        (next_slot t0900 t0930)
        (next_slot t0930 t1000)
        (next_slot t1000 t1030)
        (next_slot t1030 t1100)
        (next_slot t1100 t1130)
        (next_slot t1130 t1200)
        (next_slot t1200 t1230)
        (next_slot t1230 t1300)
        (next_slot t1300 t1330)
        (next_slot t1330 t1400)
        (next_slot t1400 t1430)
        (next_slot t1430 t1500)
        (next_slot t1500 t1530)
        (next_slot t1530 t1600)
        (next_slot t1600 t1630)

        ; Arthur's busy schedule: 9:00-9:30, 10:30-12:00, 16:00-17:00
        (busy arthur t0900)
        (busy arthur t1030)
        (busy arthur t1100)
        (busy arthur t1130)
        (busy arthur t1600)
        (busy arthur t1630)

        ; Michael's busy schedule: 13:00-13:30, 14:00-14:30
        (busy michael t1300)
        (busy michael t1400)

        ; Samantha's busy schedule: 10:30-11:00, 12:00-15:00, 15:30-17:00
        (busy samantha t1030)
        (busy samantha t1200)
        (busy samantha t1230)
        (busy samantha t1300)
        (busy samantha t1330)
        (busy samantha t1400)
        (busy samantha t1430)
        (busy samantha t1530)
        (busy samantha t1600)
        (busy samantha t1630)
    )
    (:goal (exists (?ts1 - time_slot ?ts2 - time_slot)
        (and (meeting_scheduled ?ts1 ?ts2))
    ))