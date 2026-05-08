(define (problem schedule_meeting_monday_instance_problem)
  (:domain schedule_meeting_monday_instance)

  (:objects
    m_0900_0930
    m_0930_1000
    m_1000_1030
    m_1030_1100
    m_1100_1130
    m_1130_1200
    m_1200_1230
    m_1230_1300
    m_1300_1330
    m_1330_1400
    m_1400_1430
    m_1430_1500
    m_1500_1530
    m_1530_1600
    m_1600_1630
    m_1630_1700 - slot
  )

  (:init
    (no_slot_chosen)

    (next_slot m_0900_0930 m_0930_1000)
    (next_slot m_0930_1000 m_1000_1030)
    (next_slot m_1000_1030 m_1030_1100)
    (next_slot m_1030_1100 m_1100_1130)
    (next_slot m_1100_1130 m_1130_1200)
    (next_slot m_1130_1200 m_1200_1230)
    (next_slot m_1200_1230 m_1230_1300)
    (next_slot m_1230_1300 m_1300_1330)
    (next_slot m_1300_1330 m_1330_1400)
    (next_slot m_1330_1400 m_1400_1430)
    (next_slot m_1400_1430 m_1430_1500)
    (next_slot m_1430_1500 m_1500_1530)
    (next_slot m_1500_1530 m_1530_1600)
    (next_slot m_1530_1600 m_1600_1630)
    (next_slot m_1600_1630 m_1630_1700)

    (free theresa m_0930_1000)
    (free theresa m_1000_1030)
    (free theresa m_1030_1100)
    (free theresa m_1100_1130)
    (free theresa m_1130_1200)
    (free theresa m_1200_1230)
    (free theresa m_1330_1400)
    (free theresa m_1500_1530)
    (free theresa m_1530_1600)
    (free theresa m_1600_1630)

    (free charles m_0900_0930)
    (free charles m_0930_1000)
    (free charles m_1030_1100)
    (free charles m_1100_1130)
    (free charles m_1230_1300)
    (free charles m_1300_1330)
    (free charles m_1330_1400)
    (free charles m_1530_1600)
    (free charles m_1600_1630)
    (free charles m_1630_1700)

    (free betty m_1030_1100)
    (free betty m_1100_1130)
    (free betty m_1130_1200)
    (free betty m_1230_1300)
    (free betty m_1400_1430)
    (free betty m_1430_1500)
    (free betty m_1600_1630)
    (free betty m_1630_1700)
  )

  (:goal
    (meeting_scheduled)
  )
)