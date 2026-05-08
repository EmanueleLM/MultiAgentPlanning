(define (problem schedule_meeting_katherine_nicole_kevin_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (no_slot_selected_yet)

    (next_slot s_0900_0930 s_0930_1000)
    (next_slot s_0930_1000 s_1000_1030)
    (next_slot s_1000_1030 s_1030_1100)
    (next_slot s_1030_1100 s_1100_1130)
    (next_slot s_1100_1130 s_1130_1200)
    (next_slot s_1130_1200 s_1200_1230)
    (next_slot s_1200_1230 s_1230_1300)
    (next_slot s_1230_1300 s_1300_1330)
    (next_slot s_1300_1330 s_1330_1400)
    (next_slot s_1330_1400 s_1400_1430)
    (next_slot s_1400_1430 s_1430_1500)
    (next_slot s_1430_1500 s_1500_1530)
    (next_slot s_1500_1530 s_1530_1600)
    (next_slot s_1530_1600 s_1600_1630)
    (next_slot s_1600_1630 s_1630_1700)

    (available katherine s_0900_0930)
    (available katherine s_0930_1000)
    (available katherine s_1000_1030)
    (available katherine s_1030_1100)
    (available katherine s_1100_1130)
    (available katherine s_1130_1200)
    (available katherine s_1200_1230)
    (available katherine s_1230_1300)
    (available katherine s_1300_1330)
    (available katherine s_1330_1400)
    (available katherine s_1400_1430)
    (available katherine s_1430_1500)
    (available katherine s_1500_1530)
    (available katherine s_1530_1600)
    (available katherine s_1600_1630)
    (available katherine s_1630_1700)

    (available nicole s_0900_0930)
    (available nicole s_0930_1000)
    (available nicole s_1000_1030)
    (available nicole s_1030_1100)
    (available nicole s_1100_1130)
    (available nicole s_1130_1200)
    (available nicole s_1200_1230)
    (available nicole s_1230_1300)
    (available nicole s_1300_1330)
    (available nicole s_1330_1400)
    (available nicole s_1400_1430)
    (available nicole s_1430_1500)
    (available nicole s_1500_1530)
    (available nicole s_1530_1600)
    (available nicole s_1600_1630)
    (available nicole s_1630_1700)

    (available kevin s_1000_1030)
    (available kevin s_1130_1200)
    (available kevin s_1530_1600)
    (available kevin s_1600_1630)
  )

  (:goal
    (meeting_scheduled)
  )
)