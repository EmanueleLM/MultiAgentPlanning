(define (problem calendar_scheduling_example_18_problem)
    (:domain calendar_scheduling_example_18)
    (:objects
        brian billy patricia - person
        slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
        slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
        slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
        slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - time_slot
    )
    (:init
        ; Initialize total-cost
        (= (total-cost) 0)
        ; Initialize the no_meeting_scheduled flag, allowing a meeting to be scheduled
        (no_meeting_scheduled)

        ; Brian's availability: No meetings the whole day (9:00 to 17:00)
        (brian_available slot_0900_0930)
        (brian_available slot_0930_1000)
        (brian_available slot_1000_1030)
        (brian_available slot_1030_1100)
        (brian_available slot_1100_1130)
        (brian_available slot_1130_1200)
        (brian_available slot_1200_1230)
        (brian_available slot_1230_1300)
        (brian_available slot_1300_1330)
        (brian_available slot_1330_1400)
        (brian_available slot_1400_1430)
        (brian_available slot_1430_1500)
        (brian_available slot_1500_1530)
        (brian_available slot_1530_1600)
        (brian_available slot_1600_1630)
        (brian_available slot_1630_1700)

        ; Billy's availability: Busy on Monday during 10:00 to 10:30, 11:30 to 12:00, 14:00 to 14:30, 16:30 to 17:00
        (billy_available slot_0900_0930)
        (billy_available slot_0930_1000)
        ; Billy is busy slot_1000_1030 (10:00 to 10:30)
        (billy_available slot_1030_1100)
        (billy_available slot_1100_1130)
        ; Billy is busy slot_1130_1200 (11:30 to 12:00)
        (billy_available slot_1200_1230)
        (billy_available slot_1230_1300)
        (billy_available slot_1300_1330)
        (billy_available slot_1330_1400)
        ; Billy is busy slot_1400_1430 (14:00 to 14:30)
        (billy_available slot_1430_1500)
        (billy_available slot_1500_1530)
        (billy_available slot_1530_1600)
        (billy_available slot_1600_1630)
        ; Billy is busy slot_1630_1700 (16:30 to 17:00)

        ; Patricia's availability: Busy on Monday during 9:00 to 12:30, 13:30 to 14:00, 14:30 to 16:00, 16:30 to 17:00
        ; Patricia is busy slot_0900_0930 through slot_1200_1230 (9:00 to 12:30)
        (patricia_available slot_1230_1300)
        (patricia_available slot_1300_1330)
        ; Patricia is busy slot_1330_1400 (13:30 to 14:00)
        (patricia_available slot_1400_1430)
        ; Patricia is busy slot_1430_1500 through slot_1530_1600 (14:30 to 16:00)
        (patricia_available slot_1600_1630)
        ; Patricia is busy slot_1630_1700 (16:30 to 17:00)

        ; Billy's preference: Avoid meetings after 15:30
        (billy_prefers_avoid slot_1530_1600)
        (billy_prefers_avoid slot_1600_1630)
        (billy_prefers_avoid slot_1630_1700)
    )
    (:goal (not (no_meeting_scheduled))) ; A meeting must be scheduled
    (:metric minimize (total-cost))
)