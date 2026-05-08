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
        ; Brian's availability: No meetings the whole day (9:00 to 17:00)
        (person_available brian slot_0900_0930)
        (person_available brian slot_0930_1000)
        (person_available brian slot_1000_1030)
        (person_available brian slot_1030_1100)
        (person_available brian slot_1100_1130)
        (person_available brian slot_1130_1200)
        (person_available brian slot_1200_1230)
        (person_available brian slot_1230_1300)
        (person_available brian slot_1300_1330)
        (person_available brian slot_1330_1400)
        (person_available brian slot_1400_1430)
        (person_available brian slot_1430_1500)
        (person_available brian slot_1500_1530)
        (person_available brian slot_1530_1600)
        (person_available brian slot_1600_1630)
        (person_available brian slot_1630_1700)

        ; Billy's availability: Busy on Monday during 10:00 to 10:30, 11:30 to 12:00, 14:00 to 14:30, 16:30 to 17:00
        (person_available billy slot_0900_0930)
        (person_available billy slot_0930_1000)
        ; (person_available billy slot_1000_1030) ; Billy busy
        (person_available billy slot_1030_1100)
        (person_available billy slot_1100_1130)
        ; (person_available billy slot_1130_1200) ; Billy busy
        (person_available billy slot_1200_1230)
        (person_available billy slot_1230_1300)
        (person_available billy slot_1300_1330)
        (person_available billy slot_1330_1400)
        ; (person_available billy slot_1400_1430) ; Billy busy
        (person_available billy slot_1430_1500)
        (person_available billy slot_1500_1530)
        (person_available billy slot_1530_1600)
        (person_available billy slot_1600_1630)
        ; (person_available billy slot_1630_1700) ; Billy busy

        ; Patricia's availability: Busy on Monday during 9:00 to 12:30, 13:30 to 14:00, 14:30 to 16:00, 16:30 to 17:00
        ; (person_available patricia slot_0900_0930) ; Patricia busy
        ; (person_available patricia slot_0930_1000) ; Patricia busy
        ; (person_available patricia slot_1000_1030) ; Patricia busy
        ; (person_available patricia slot_1030_1100) ; Patricia busy
        ; (person_available patricia slot_1100_1130) ; Patricia busy
        ; (person_available patricia slot_1130_1200) ; Patricia busy
        ; (person_available patricia slot_1200_1230) ; Patricia busy
        (person_available patricia slot_1230_1300)
        (person_available patricia slot_1300_1330)
        ; (person_available patricia slot_1330_1400) ; Patricia busy
        (person_available patricia slot_1400_1430)
        ; (person_available patricia slot_1430_1500) ; Patricia busy
        ; (person_available patricia slot_1500_1530) ; Patricia busy
        ; (person_available patricia slot_1530_1600) ; Patricia busy
        (person_available patricia slot_1600_1630)
        ; (person_available patricia slot_1630_1700) ; Patricia busy

        ; Billy's preference: Avoid meetings after 15:30
        (billy_prefers_avoid slot_1530_1600)
        (billy_prefers_avoid slot_1600_1630)
        (billy_prefers_avoid slot_1630_1700)
    )
    (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
    (:metric minimize (total-cost))
)