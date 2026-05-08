(define (problem monday_meeting_janet_rachel_cynthia)
  (:domain monday_meeting_scheduling)

  (:objects
    janet rachel cynthia - participant
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

    (allowed_start s_1330_1400)
    (allowed_start s_1400_1430)
    (allowed_start s_1430_1500)
    (allowed_start s_1500_1530)
    (allowed_start s_1530_1600)
    (allowed_start s_1600_1630)

    (participant_free janet s_0900_0930)
    (participant_free janet s_1030_1100)
    (participant_free janet s_1100_1130)
    (participant_free janet s_1130_1200)
    (participant_free janet s_1200_1230)
    (participant_free janet s_1300_1330)
    (participant_free janet s_1330_1400)
    (participant_free janet s_1430_1500)
    (participant_free janet s_1500_1530)
    (participant_free janet s_1530_1600)
    (participant_free janet s_1600_1630)
    (participant_free janet s_1630_1700)

    (participant_free rachel s_0900_0930)
    (participant_free rachel s_0930_1000)
    (participant_free rachel s_1000_1030)
    (participant_free rachel s_1030_1100)
    (participant_free rachel s_1100_1130)
    (participant_free rachel s_1130_1200)
    (participant_free rachel s_1200_1230)
    (participant_free rachel s_1230_1300)
    (participant_free rachel s_1300_1330)
    (participant_free rachel s_1330_1400)
    (participant_free rachel s_1400_1430)
    (participant_free rachel s_1430_1500)
    (participant_free rachel s_1500_1530)
    (participant_free rachel s_1530_1600)
    (participant_free rachel s_1600_1630)
    (participant_free rachel s_1630_1700)

    (participant_free cynthia s_0900_0930)
    (participant_free cynthia s_1000_1030)
    (participant_free cynthia s_1030_1100)
    (participant_free cynthia s_1130_1200)
    (participant_free cynthia s_1200_1230)
    (participant_free cynthia s_1430_1500)
    (participant_free cynthia s_1500_1530)
    (participant_free cynthia s_1530_1600)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)