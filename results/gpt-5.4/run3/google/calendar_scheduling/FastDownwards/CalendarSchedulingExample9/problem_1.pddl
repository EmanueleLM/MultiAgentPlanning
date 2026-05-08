(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    meeting_1 - meeting
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
    (meeting_unscheduled meeting_1)

    (participant_available diane monday_0930_1000)
    (participant_available diane monday_1000_1030)
    (participant_available diane monday_1030_1100)
    (participant_available diane monday_1100_1130)
    (participant_available diane monday_1130_1200)
    (participant_available diane monday_1230_1300)
    (participant_available diane monday_1300_1330)
    (participant_available diane monday_1330_1400)
    (participant_available diane monday_1400_1430)
    (participant_available diane monday_1530_1600)
    (participant_available diane monday_1600_1630)
    (participant_available diane monday_1630_1700)

    (participant_available kelly monday_0900_0930)
    (participant_available kelly monday_1000_1030)
    (participant_available kelly monday_1100_1130)
    (participant_available kelly monday_1130_1200)
    (participant_available kelly monday_1200_1230)
    (participant_available kelly monday_1230_1300)
    (participant_available kelly monday_1300_1330)
    (participant_available kelly monday_1330_1400)
    (participant_available kelly monday_1400_1430)
    (participant_available kelly monday_1430_1500)
    (participant_available kelly monday_1500_1530)
    (participant_available kelly monday_1530_1600)
    (participant_available kelly monday_1600_1630)
    (participant_available kelly monday_1630_1700)

    (participant_available deborah monday_0930_1000)
    (participant_available deborah monday_1400_1430)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1 monday_1400_1430)
    )
  )
)