(define (problem schedule_margaret_donna_helen_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    margaret donna helen - participant
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
    (current_slot s0900_0930)

    (next_slot s0900_0930 s0930_1000)
    (next_slot s0930_1000 s1000_1030)
    (next_slot s1000_1030 s1030_1100)
    (next_slot s1030_1100 s1100_1130)
    (next_slot s1100_1130 s1130_1200)
    (next_slot s1130_1200 s1200_1230)
    (next_slot s1200_1230 s1230_1300)
    (next_slot s1230_1300 s1300_1330)
    (next_slot s1300_1330 s1330_1400)
    (next_slot s1330_1400 s1400_1430)
    (next_slot s1400_1430 s1430_1500)
    (next_slot s1430_1500 s1500_1530)
    (next_slot s1500_1530 s1530_1600)
    (next_slot s1530_1600 s1600_1630)
    (next_slot s1600_1630 s1630_1700)

    (available margaret s1000_1030)
    (available margaret s1100_1130)
    (available margaret s1200_1230)
    (available margaret s1230_1300)
    (available margaret s1330_1400)
    (available margaret s1400_1430)
    (available margaret s1430_1500)
    (available margaret s1530_1600)
    (available margaret s1600_1630)
    (available margaret s1630_1700)

    (available donna s0900_0930)
    (available donna s0930_1000)
    (available donna s1000_1030)
    (available donna s1030_1100)
    (available donna s1100_1130)
    (available donna s1130_1200)
    (available donna s1200_1230)
    (available donna s1230_1300)
    (available donna s1300_1330)
    (available donna s1330_1400)
    (available donna s1400_1430)
    (available donna s1500_1530)
    (available donna s1530_1600)
    (available donna s1630_1700)

    (available helen s0930_1000)
    (available helen s1130_1200)
    (available helen s1200_1230)
    (available helen s1230_1300)
    (available helen s1400_1430)
    (available helen s1500_1530)

    (allowed_for_meeting s0900_0930)
    (allowed_for_meeting s0930_1000)
    (allowed_for_meeting s1000_1030)
    (allowed_for_meeting s1030_1100)
    (allowed_for_meeting s1100_1130)
    (allowed_for_meeting s1130_1200)
    (allowed_for_meeting s1200_1230)
    (allowed_for_meeting s1230_1300)
    (allowed_for_meeting s1300_1330)
  )

  (:goal
    (and
      (scheduled)
      (or)
    )
  )
)