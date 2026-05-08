(define (problem schedule_meeting_monday_janet_rachel_cynthia)
  (:domain meeting_schedule_monday_instance)

  (:objects
    janet rachel cynthia - participant

    s_0900_0930
    s_0930_1000
    s_1000_1030
    s_1030_1100
    s_1100_1130
    s_1130_1200
    s_1200_1230
    s_1230_1300
    s_1300_1330
    s_1330_1400
    s_1400_1430
    s_1430_1500
    s_1500_1530
    s_1530_1600
    s_1600_1630
    s_1630_1700 - slot

    i_0900_1000
    i_0930_1030
    i_1000_1100
    i_1030_1130
    i_1100_1200
    i_1130_1230
    i_1200_1300
    i_1230_1330
    i_1300_1400
    i_1330_1430
    i_1400_1500
    i_1430_1530
    i_1500_1600
    i_1530_1630
    i_1600_1700 - interval

    meeting_1 - meeting
  )

  (:init
    (requires_participant meeting_1 janet)
    (requires_participant meeting_1 rachel)
    (requires_participant meeting_1 cynthia)

    (interval_slot1 i_0900_1000 s_0900_0930)
    (interval_slot2 i_0900_1000 s_0930_1000)

    (interval_slot1 i_0930_1030 s_0930_1000)
    (interval_slot2 i_0930_1030 s_1000_1030)

    (interval_slot1 i_1000_1100 s_1000_1030)
    (interval_slot2 i_1000_1100 s_1030_1100)

    (interval_slot1 i_1030_1130 s_1030_1100)
    (interval_slot2 i_1030_1130 s_1100_1130)

    (interval_slot1 i_1100_1200 s_1100_1130)
    (interval_slot2 i_1100_1200 s_1130_1200)

    (interval_slot1 i_1130_1230 s_1130_1200)
    (interval_slot2 i_1130_1230 s_1200_1230)

    (interval_slot1 i_1200_1300 s_1200_1230)
    (interval_slot2 i_1200_1300 s_1230_1300)

    (interval_slot1 i_1230_1330 s_1230_1300)
    (interval_slot2 i_1230_1330 s_1300_1330)

    (interval_slot1 i_1300_1400 s_1300_1330)
    (interval_slot2 i_1300_1400 s_1330_1400)

    (interval_slot1 i_1330_1430 s_1330_1400)
    (interval_slot2 i_1330_1430 s_1400_1430)

    (interval_slot1 i_1400_1500 s_1400_1430)
    (interval_slot2 i_1400_1500 s_1430_1500)

    (interval_slot1 i_1430_1530 s_1430_1500)
    (interval_slot2 i_1430_1530 s_1500_1530)

    (interval_slot1 i_1500_1600 s_1500_1530)
    (interval_slot2 i_1500_1600 s_1530_1600)

    (interval_slot1 i_1530_1630 s_1530_1600)
    (interval_slot2 i_1530_1630 s_1600_1630)

    (interval_slot1 i_1600_1700 s_1600_1630)
    (interval_slot2 i_1600_1700 s_1630_1700)

    (available janet s_0900_0930)
    (available janet s_1030_1100)
    (available janet s_1100_1130)
    (available janet s_1130_1200)
    (available janet s_1200_1230)
    (available janet s_1300_1330)
    (available janet s_1330_1400)
    (available janet s_1430_1500)
    (available janet s_1500_1530)
    (available janet s_1530_1600)
    (available janet s_1600_1630)
    (available janet s_1630_1700)

    (available rachel s_0900_0930)
    (available rachel s_0930_1000)
    (available rachel s_1000_1030)
    (available rachel s_1030_1100)
    (available rachel s_1100_1130)
    (available rachel s_1130_1200)
    (available rachel s_1200_1230)
    (available rachel s_1230_1300)
    (available rachel s_1300_1330)
    (available rachel s_1330_1400)
    (available rachel s_1400_1430)
    (available rachel s_1430_1500)
    (available rachel s_1500_1530)
    (available rachel s_1530_1600)
    (available rachel s_1600_1630)
    (available rachel s_1630_1700)

    (available cynthia s_0900_0930)
    (available cynthia s_1000_1030)
    (available cynthia s_1030_1100)
    (available cynthia s_1130_1200)
    (available cynthia s_1200_1230)
    (available cynthia s_1430_1500)
    (available cynthia s_1500_1530)
    (available cynthia s_1530_1600)

    (allowed_interval meeting_1 i_1330_1430)
    (allowed_interval meeting_1 i_1400_1500)
    (allowed_interval meeting_1 i_1430_1530)
    (allowed_interval meeting_1 i_1500_1600)
    (allowed_interval meeting_1 i_1530_1630)
    (allowed_interval meeting_1 i_1600_1700)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)