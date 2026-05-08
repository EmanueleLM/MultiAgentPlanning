(define (problem meeting_scheduler_monday_instance_problem)
  (:domain meeting_scheduler_monday_instance)

  (:objects
    thomas dylan jerry - participant
    meeting_1 - meeting
    w_0900_1000
    w_0930_1030
    w_1000_1100
    w_1030_1130
    w_1100_1200
    w_1130_1230
    w_1200_1300
    w_1230_1330
    w_1300_1400
    w_1330_1430
    w_1400_1500
    w_1430_1530
    w_1500_1600
    w_1530_1630
    w_1600_1700 - window
  )

  (:init
    (unscheduled meeting_1)

    (required meeting_1 thomas)
    (required meeting_1 dylan)
    (required meeting_1 jerry)

    (available thomas w_0900_1000)
    (available thomas w_0930_1030)
    (available thomas w_1000_1100)
    (available thomas w_1030_1130)
    (available thomas w_1100_1200)
    (available thomas w_1130_1230)
    (available thomas w_1200_1300)
    (available thomas w_1230_1330)
    (available thomas w_1300_1400)
    (available thomas w_1330_1430)
    (available thomas w_1400_1500)
    (available thomas w_1430_1530)
    (available thomas w_1500_1600)
    (available thomas w_1530_1630)
    (available thomas w_1600_1700)

    (available dylan w_0900_1000)
    (available dylan w_0930_1030)
    (available dylan w_1100_1200)
    (available dylan w_1130_1230)
    (available dylan w_1200_1300)
    (available dylan w_1230_1330)
    (available dylan w_1400_1500)
    (available dylan w_1430_1530)
    (available dylan w_1500_1600)
    (available dylan w_1530_1630)
    (available dylan w_1600_1700)

    (available jerry w_1430_1530)
    (available jerry w_1500_1600)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)