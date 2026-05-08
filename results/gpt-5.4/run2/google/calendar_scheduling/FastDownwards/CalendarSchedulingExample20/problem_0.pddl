(define (problem schedule_meeting_ralph_peter_daniel_monday)
  (:domain meeting_scheduler_monday_instance)

  (:objects
    ralph peter daniel - participant
    t_0900_0930
    t_0930_1000
    t_1000_1030
    t_1030_1100
    t_1100_1130
    t_1130_1200
    t_1200_1230
    t_1230_1300
    t_1300_1330
    t_1330_1400
    t_1400_1430
    t_1430_1500
    t_1500_1530
    t_1530_1600
    t_1600_1630
    t_1630_1700 - timeslot
  )

  (:init
    (busy ralph t_1330_1400)
    (busy ralph t_1430_1500)

    (busy peter t_0900_0930)
    (busy peter t_1100_1130)
    (busy peter t_1130_1200)
    (busy peter t_1200_1230)
    (busy peter t_1230_1300)
    (busy peter t_1600_1630)

    (busy daniel t_0900_0930)
    (busy daniel t_0930_1000)
    (busy daniel t_1030_1100)
    (busy daniel t_1100_1130)
    (busy daniel t_1130_1200)
    (busy daniel t_1200_1230)
    (busy daniel t_1230_1300)
    (busy daniel t_1300_1330)
    (busy daniel t_1330_1400)
    (busy daniel t_1400_1430)
    (busy daniel t_1430_1500)
    (busy daniel t_1500_1530)
    (busy daniel t_1600_1630)
    (busy daniel t_1630_1700)

    (allowed t_0900_0930)
    (allowed t_0930_1000)
    (allowed t_1000_1030)
    (allowed t_1030_1100)
    (allowed t_1100_1130)
    (allowed t_1130_1200)
    (allowed t_1200_1230)
    (allowed t_1230_1300)
    (allowed t_1300_1330)
    (allowed t_1330_1400)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)