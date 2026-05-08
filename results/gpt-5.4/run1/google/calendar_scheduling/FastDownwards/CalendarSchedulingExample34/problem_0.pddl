(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    willie richard noah - participant
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )

  (:init
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

    (free willie s0900_0930)
    (free willie s0930_1000)
    (free willie s1000_1030)
    (free willie s1030_1100)
    (free willie s1100_1130)
    (free willie s1130_1200)
    (free willie s1200_1230)
    (free willie s1230_1300)
    (free willie s1300_1330)
    (free willie s1330_1400)
    (free willie s1400_1430)
    (free willie s1430_1500)
    (free willie s1500_1530)
    (free willie s1530_1600)
    (free willie s1600_1630)
    (free willie s1630_1700)

    (free richard s0900_0930)
    (free richard s0930_1000)
    (free richard s1030_1100)
    (free richard s1200_1230)
    (free richard s1230_1300)
    (free richard s1400_1430)
    (free richard s1430_1500)
    (free richard s1500_1530)
    (free richard s1530_1600)
    (free richard s1630_1700)

    (free noah s0900_0930)
    (free noah s0930_1000)
    (free noah s1030_1100)
    (free noah s1100_1130)
    (free noah s1300_1330)
    (free noah s1400_1430)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)