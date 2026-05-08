(define (problem meeting_schedule_raymond_billy_donald_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    t0900_0930
    t1000_1030
    t1030_1100
    t1130_1200
    t1200_1230
    t1230_1300
    t1300_1330
    t1400_1430
    t1500_1530
    t1530_1600
    t1600_1630
    t1630_1700 - slot
    meeting_raymond_billy_donald - meeting
  )

  (:init
    (meeting_unscheduled meeting_raymond_billy_donald)

    (participant_free raymond t0930_1000)
    (participant_free raymond t1000_1030)
    (participant_free raymond t1030_1100)
    (participant_free raymond t1100_1130)
    (participant_free raymond t1200_1230)
    (participant_free raymond t1230_1300)
    (participant_free raymond t1330_1400)
    (participant_free raymond t1400_1430)
    (participant_free raymond t1430_1500)
    (participant_free raymond t1530_1600)
    (participant_free raymond t1600_1630)
    (participant_free raymond t1630_1700)

    (participant_free billy t0900_0930)
    (participant_free billy t0930_1000)
    (participant_free billy t1030_1100)
    (participant_free billy t1100_1130)
    (participant_free billy t1130_1200)
    (participant_free billy t1300_1330)
    (participant_free billy t1330_1400)
    (participant_free billy t1400_1430)
    (participant_free billy t1430_1500)
    (participant_free billy t1500_1530)
    (participant_free billy t1530_1600)
    (participant_free billy t1600_1630)

    (participant_free donald t0930_1000)
    (participant_free donald t1100_1130)
    (participant_free donald t1130_1200)
    (participant_free donald t1300_1330)
    (participant_free donald t1330_1400)
    (participant_free donald t1430_1500)
    (participant_free donald t1500_1530)
    (participant_free donald t1530_1600)
  )

  (:goal
    (and
      (meeting_scheduled meeting_raymond_billy_donald)
    )
  )
)