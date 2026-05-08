(define (problem schedule_meeting_instance_monday)
  (:domain schedule_meeting_monday_halfhour)

  (:objects
    joyce christine alexander - participant
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )

  (:init
    (participant_required joyce)
    (participant_required christine)
    (participant_required alexander)

    (blocked joyce t1100_1130)
    (blocked joyce t1330_1400)
    (blocked joyce t1430_1500)
    (blocked joyce t1500_1530)
    (blocked joyce t1530_1600)
    (blocked joyce t1600_1630)

    (blocked christine t0900_0930)
    (blocked christine t0930_1000)
    (blocked christine t1000_1030)
    (blocked christine t1030_1100)
    (blocked christine t1100_1130)
    (blocked christine t1130_1200)

    (blocked alexander t0900_0930)
    (blocked alexander t0930_1000)
    (blocked alexander t1000_1030)
    (blocked alexander t1030_1100)
    (blocked alexander t1200_1230)
    (blocked alexander t1330_1400)
    (blocked alexander t1400_1430)
    (blocked alexander t1430_1500)
    (blocked alexander t1530_1600)
    (blocked alexander t1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)