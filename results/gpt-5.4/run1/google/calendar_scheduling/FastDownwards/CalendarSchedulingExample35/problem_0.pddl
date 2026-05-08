(define (problem meeting_schedule_monday_bzt_instance)
  (:domain meeting_schedule_monday_bzt)

  (:objects
    bradley zachary teresa - participant
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
    meeting_bzt - meeting
  )

  (:init
    (unscheduled meeting_bzt)

    (requires meeting_bzt bradley)
    (requires meeting_bzt zachary)
    (requires meeting_bzt teresa)

    (allowed_slot s_1430_1500)
    (allowed_slot s_1500_1530)
    (allowed_slot s_1530_1600)
    (allowed_slot s_1600_1630)
    (allowed_slot s_1630_1700)

    (free bradley s_0900_0930)
    (free bradley s_0930_1000)
    (free bradley s_1000_1030)
    (free bradley s_1030_1100)
    (free bradley s_1100_1130)
    (free bradley s_1130_1200)
    (free bradley s_1200_1230)
    (free bradley s_1230_1300)
    (free bradley s_1300_1330)
    (free bradley s_1330_1400)
    (free bradley s_1400_1430)
    (free bradley s_1430_1500)
    (free bradley s_1500_1530)
    (free bradley s_1530_1600)
    (free bradley s_1600_1630)
    (free bradley s_1630_1700)

    (free zachary s_0900_0930)
    (free zachary s_0930_1000)
    (free zachary s_1030_1100)
    (free zachary s_1100_1130)
    (free zachary s_1130_1200)
    (free zachary s_1200_1230)
    (free zachary s_1230_1300)
    (free zachary s_1300_1330)
    (free zachary s_1330_1400)
    (free zachary s_1400_1430)
    (free zachary s_1430_1500)
    (free zachary s_1530_1600)
    (free zachary s_1600_1630)
    (free zachary s_1630_1700)

    (free teresa s_1030_1100)
    (free teresa s_1230_1300)
    (free teresa s_1400_1430)
    (free teresa s_1630_1700)
  )

  (:goal
    (and
      (scheduled meeting_bzt s_1630_1700)
      (not (unscheduled meeting_bzt))
    )
  )
)