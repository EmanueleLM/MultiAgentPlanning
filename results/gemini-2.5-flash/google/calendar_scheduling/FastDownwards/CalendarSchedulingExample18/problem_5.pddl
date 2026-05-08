(define (problem calendar_scheduling_example_18_problem)
    (:domain calendar_scheduling_example_18)
    (:objects
        slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
        slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
        slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
        slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - time_slot
    )
    (:init
        (= (total-cost) 0)

        ; Brian's availability (no meetings the whole day)
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

        ; Billy's availability
        ; Busy: 10:00-10:30, 11:30-12:00, 14:00-14:30, 16:30-17:00
        (person_available billy slot_0900_0930)
        (person_available billy slot_0930_1000)
        (person_available billy slot_1030_1100)
        (person_available billy slot_1100_1130)
        (person_available billy slot_1200_1230)
        (person_available billy slot_1230_1300)
        (person_available billy slot_1300_1330)
        (person_available billy slot_1330_1400)
        (person_available billy slot_1430_1500)
        (person_available billy slot_1500_1530)
        (person_available billy slot_1530_1600)
        (person_available billy slot_1600_1630)

        ; Patricia's availability
        ; Busy: 9:00-12:30, 13:30-14:00, 14:30-16:00, 16:30-17:00
        (person_available patricia slot_1230_1300)
        (person_available patricia slot_1300_1330)
        (person_available patricia slot_1400_1430)
        (person_available patricia slot_1600_1630)

        ; Billy's avoidance preference: after 15:30
        (billy_avoids_after_1530 slot_1530_1600)
        (billy_avoids_after_1530 slot_1600_1630)
        (billy_avoids_after_1530 slot_1630_1700)
    )
    (:goal (meeting_scheduled_overall))
    (:metric minimize (total-cost))
)