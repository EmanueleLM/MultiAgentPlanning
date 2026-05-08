(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    alan nancy patricia - participant
    slot_0900_0930
    slot_0930_1000
    slot_1000_1030
    slot_1030_1100
    slot_1100_1130
    slot_1130_1200
    slot_1200_1230
    slot_1230_1300
    slot_1300_1330
    slot_1330_1400
    slot_1400_1430
    slot_1430_1500
    slot_1500_1530
    slot_1530_1600
    slot_1600_1630
    slot_1630_1700 - slot
  )

  (:init
    (free alan slot_0900_0930)
    (free alan slot_0930_1000)
    (free alan slot_1000_1030)
    (free alan slot_1030_1100)
    (free alan slot_1100_1130)
    (free alan slot_1130_1200)
    (free alan slot_1200_1230)
    (free alan slot_1230_1300)
    (free alan slot_1300_1330)
    (free alan slot_1330_1400)
    (free alan slot_1400_1430)
    (free alan slot_1430_1500)
    (free alan slot_1500_1530)
    (free alan slot_1530_1600)
    (free alan slot_1600_1630)
    (free alan slot_1630_1700)

    (free nancy slot_0900_0930)
    (free nancy slot_0930_1000)
    (free nancy slot_1000_1030)
    (free nancy slot_1030_1100)
    (free nancy slot_1230_1300)
    (free nancy slot_1330_1400)
    (free nancy slot_1500_1530)
    (free nancy slot_1530_1600)
    (free nancy slot_1600_1630)
    (free nancy slot_1630_1700)

    (free patricia slot_0900_0930)
    (free patricia slot_0930_1000)
    (free patricia slot_1200_1230)
    (free patricia slot_1300_1330)
    (free patricia slot_1600_1630)
    (free patricia slot_1630_1700)

    (acceptable_start slot_1430_1500)
    (acceptable_start slot_1500_1530)
    (acceptable_start slot_1530_1600)
    (acceptable_start slot_1600_1630)
    (acceptable_start slot_1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)