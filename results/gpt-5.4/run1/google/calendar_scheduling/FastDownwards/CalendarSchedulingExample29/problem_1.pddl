(define (problem monday_meeting_scheduling_instance_problem)
  (:domain monday_meeting_scheduling_instance)

  (:objects
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
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

    (free madison s_0900_0930)
    (free madison s_1000_1030)
    (free madison s_1030_1100)
    (free madison s_1100_1130)
    (free madison s_1200_1230)
    (free madison s_1230_1300)
    (free madison s_1300_1330)
    (free madison s_1330_1400)
    (free madison s_1400_1430)
    (free madison s_1430_1500)
    (free madison s_1500_1530)
    (free madison s_1530_1600)
    (free madison s_1600_1630)
    (free madison s_1630_1700)

    (free diana s_0900_0930)
    (free diana s_0930_1000)
    (free diana s_1000_1030)
    (free diana s_1030_1100)
    (free diana s_1130_1200)
    (free diana s_1200_1230)
    (free diana s_1230_1300)
    (free diana s_1330_1400)
    (free diana s_1400_1430)
    (free diana s_1430_1500)
    (free diana s_1500_1530)
    (free diana s_1530_1600)
    (free diana s_1600_1630)
    (free diana s_1630_1700)

    (free shirley s_1200_1230)
    (free shirley s_1230_1300)
    (free shirley s_1300_1330)
    (free shirley s_1500_1530)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)