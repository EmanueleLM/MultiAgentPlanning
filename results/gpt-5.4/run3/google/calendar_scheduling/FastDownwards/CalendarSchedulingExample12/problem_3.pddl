(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    david debra kevin - participant
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

    (free david s_0900_0930)
    (free david s_0930_1000)
    (free david s_1000_1030)
    (free david s_1030_1100)
    (free david s_1100_1130)
    (free david s_1130_1200)
    (free david s_1200_1230)
    (free david s_1230_1300)
    (free david s_1300_1330)
    (free david s_1330_1400)
    (free david s_1400_1430)
    (free david s_1430_1500)
    (free david s_1500_1530)
    (free david s_1530_1600)
    (free david s_1600_1630)
    (free david s_1630_1700)

    (free debra s_0900_0930)
    (free debra s_1000_1030)
    (free debra s_1030_1100)
    (free debra s_1130_1200)
    (free debra s_1300_1330)
    (free debra s_1330_1400)
    (free debra s_1430_1500)
    (free debra s_1500_1530)
    (free debra s_1530_1600)
    (free debra s_1630_1700)

    (free kevin s_1200_1230)
    (free kevin s_1230_1300)
    (free kevin s_1300_1330)
    (free kevin s_1330_1400)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)