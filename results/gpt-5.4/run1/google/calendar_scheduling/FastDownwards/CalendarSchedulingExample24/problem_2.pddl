(define (problem calendar_scheduling_example24_problem)
  (:domain calendar_scheduling_example24)

  (:objects
    benjamin hannah brenda - participant
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
    slot_1630_1700 - timeslot
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

    (required meeting_1 benjamin)
    (required meeting_1 hannah)
    (required meeting_1 brenda)

    (allowed_start meeting_1 slot_0900_0930)

    (free benjamin slot_0900_0930)
    (free benjamin slot_0930_1000)
    (free benjamin slot_1000_1030)
    (free benjamin slot_1030_1100)
    (free benjamin slot_1100_1130)
    (free benjamin slot_1130_1200)
    (free benjamin slot_1200_1230)
    (free benjamin slot_1230_1300)
    (free benjamin slot_1300_1330)
    (free benjamin slot_1330_1400)
    (free benjamin slot_1400_1430)
    (free benjamin slot_1430_1500)
    (free benjamin slot_1500_1530)
    (free benjamin slot_1530_1600)
    (free benjamin slot_1600_1630)
    (free benjamin slot_1630_1700)

    (free hannah slot_0900_0930)
    (free hannah slot_0930_1000)
    (free hannah slot_1000_1030)
    (free hannah slot_1030_1100)
    (free hannah slot_1100_1130)
    (free hannah slot_1130_1200)
    (free hannah slot_1200_1230)
    (free hannah slot_1230_1300)
    (free hannah slot_1300_1330)
    (free hannah slot_1330_1400)
    (free hannah slot_1400_1430)
    (free hannah slot_1430_1500)
    (free hannah slot_1500_1530)
    (free hannah slot_1530_1600)
    (free hannah slot_1600_1630)
    (free hannah slot_1630_1700)

    (free brenda slot_0900_0930)
    (free brenda slot_1000_1030)
    (free brenda slot_1030_1100)
    (free brenda slot_1100_1130)
    (free brenda slot_1230_1300)
    (free brenda slot_1300_1330)
    (free brenda slot_1330_1400)
    (free brenda slot_1630_1700)
  )

  (:goal
    (and
      (scheduled_at meeting_1 slot_0900_0930)
    )
  )
)