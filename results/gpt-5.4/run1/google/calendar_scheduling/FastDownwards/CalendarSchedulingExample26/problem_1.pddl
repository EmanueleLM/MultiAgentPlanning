(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    meeting_1 - meeting
    slot_0900_0930
    slot_0930_1000
    slot_1000_1030
    slot_1030_1100
    slot_1100_1130
    slot_1130_1200
    slot_1200_1230
    slot_1230_1300
    slot_1300_1330
    slot_1330_1400
    slot_1400_1430
    slot_1430_1500
    slot_1500_1530
    slot_1530_1600
    slot_1600_1630
    slot_1630_1700 - timeslot
  )

  (:init
    (unscheduled meeting_1)

    (consecutive slot_0900_0930 slot_0930_1000)
    (consecutive slot_0930_1000 slot_1000_1030)
    (consecutive slot_1000_1030 slot_1030_1100)
    (consecutive slot_1030_1100 slot_1100_1130)
    (consecutive slot_1100_1130 slot_1130_1200)
    (consecutive slot_1130_1200 slot_1200_1230)
    (consecutive slot_1200_1230 slot_1230_1300)
    (consecutive slot_1230_1300 slot_1300_1330)
    (consecutive slot_1300_1330 slot_1330_1400)
    (consecutive slot_1330_1400 slot_1400_1430)
    (consecutive slot_1400_1430 slot_1430_1500)
    (consecutive slot_1430_1500 slot_1500_1530)
    (consecutive slot_1500_1530 slot_1530_1600)
    (consecutive slot_1530_1600 slot_1600_1630)
    (consecutive slot_1600_1630 slot_1630_1700)

    (available katherine slot_0900_0930)
    (available katherine slot_0930_1000)
    (available katherine slot_1000_1030)
    (available katherine slot_1030_1100)
    (available katherine slot_1100_1130)
    (available katherine slot_1130_1200)
    (available katherine slot_1200_1230)
    (available katherine slot_1230_1300)
    (available katherine slot_1300_1330)
    (available katherine slot_1330_1400)
    (available katherine slot_1400_1430)
    (available katherine slot_1430_1500)
    (available katherine slot_1500_1530)
    (available katherine slot_1530_1600)
    (available katherine slot_1600_1630)
    (available katherine slot_1630_1700)

    (available nicole slot_0900_0930)
    (available nicole slot_0930_1000)
    (available nicole slot_1000_1030)
    (available nicole slot_1030_1100)
    (available nicole slot_1100_1130)
    (available nicole slot_1130_1200)
    (available nicole slot_1200_1230)
    (available nicole slot_1230_1300)
    (available nicole slot_1300_1330)
    (available nicole slot_1330_1400)
    (available nicole slot_1400_1430)
    (available nicole slot_1430_1500)
    (available nicole slot_1500_1530)
    (available nicole slot_1530_1600)
    (available nicole slot_1600_1630)
    (available nicole slot_1630_1700)

    (available kevin slot_1000_1030)
    (available kevin slot_1130_1200)
    (available kevin slot_1530_1600)
    (available kevin slot_1600_1630)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)