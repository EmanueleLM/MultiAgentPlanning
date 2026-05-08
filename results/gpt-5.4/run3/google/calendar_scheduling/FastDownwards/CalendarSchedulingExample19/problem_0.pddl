(define (problem monday_meeting_schedule_instance_problem)
  (:domain monday_meeting_schedule_instance)

  (:objects
    monday_0900_0930
    monday_0930_1000
    monday_1000_1030
    monday_1030_1100
    monday_1100_1130
    monday_1130_1200
    monday_1200_1230
    monday_1230_1300
    monday_1300_1330
    monday_1330_1400
    monday_1400_1430
    monday_1430_1500
    monday_1500_1530
    monday_1530_1600
    monday_1600_1630
    monday_1630_1700 - slot
  )

  (:init
    (next_slot monday_0900_0930 monday_0930_1000)
    (next_slot monday_0930_1000 monday_1000_1030)
    (next_slot monday_1000_1030 monday_1030_1100)
    (next_slot monday_1030_1100 monday_1100_1130)
    (next_slot monday_1100_1130 monday_1130_1200)
    (next_slot monday_1130_1200 monday_1200_1230)
    (next_slot monday_1200_1230 monday_1230_1300)
    (next_slot monday_1230_1300 monday_1300_1330)
    (next_slot monday_1300_1330 monday_1330_1400)
    (next_slot monday_1330_1400 monday_1400_1430)
    (next_slot monday_1400_1430 monday_1430_1500)
    (next_slot monday_1430_1500 monday_1500_1530)
    (next_slot monday_1500_1530 monday_1530_1600)
    (next_slot monday_1530_1600 monday_1600_1630)
    (next_slot monday_1600_1630 monday_1630_1700)

    (free stephen monday_0900_0930)
    (free stephen monday_0930_1000)
    (free stephen monday_1030_1100)
    (free stephen monday_1100_1130)
    (free stephen monday_1130_1200)
    (free stephen monday_1200_1230)
    (free stephen monday_1230_1300)
    (free stephen monday_1330_1400)
    (free stephen monday_1400_1430)
    (free stephen monday_1500_1530)
    (free stephen monday_1530_1600)
    (free stephen monday_1630_1700)

    (free edward monday_0930_1000)
    (free edward monday_1030_1100)
    (free edward monday_1100_1130)
    (free edward monday_1130_1200)
    (free edward monday_1200_1230)
    (free edward monday_1230_1300)
    (free edward monday_1300_1330)
    (free edward monday_1430_1500)
    (free edward monday_1600_1630)
    (free edward monday_1630_1700)

    (free angela monday_1130_1200)
    (free angela monday_1200_1230)
    (free angela monday_1300_1330)
    (free angela monday_1500_1530)
    (free angela monday_1530_1600)
  )

  (:goal
    (and
      (meeting_scheduled)
      (meeting_start monday_1130_1200)
      (meeting_end monday_1200_1230)
    )
  )
)