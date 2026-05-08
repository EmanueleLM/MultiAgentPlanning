(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (allowed_for_meeting s_0900_0930)
    (allowed_for_meeting s_0930_1000)
    (allowed_for_meeting s_1000_1030)
    (allowed_for_meeting s_1030_1100)
    (allowed_for_meeting s_1100_1130)
    (allowed_for_meeting s_1130_1200)
    (allowed_for_meeting s_1200_1230)
    (allowed_for_meeting s_1230_1300)
    (allowed_for_meeting s_1300_1330)
    (allowed_for_meeting s_1330_1400)
    (allowed_for_meeting s_1400_1430)
    (allowed_for_meeting s_1430_1500)
    (allowed_for_meeting s_1500_1530)

    (free lisa s_1000_1030)
    (free lisa s_1130_1200)
    (free lisa s_1200_1230)
    (free lisa s_1300_1330)
    (free lisa s_1330_1400)
    (free lisa s_1400_1430)
    (free lisa s_1430_1500)
    (free lisa s_1500_1530)
    (free lisa s_1530_1600)
    (free lisa s_1630_1700)

    (free bobby s_0930_1000)
    (free bobby s_1030_1100)
    (free bobby s_1100_1130)
    (free bobby s_1200_1230)
    (free bobby s_1230_1300)
    (free bobby s_1300_1330)
    (free bobby s_1330_1400)
    (free bobby s_1400_1430)
    (free bobby s_1430_1500)
    (free bobby s_1530_1600)
    (free bobby s_1600_1630)
    (free bobby s_1630_1700)

    (free randy s_0900_0930)
    (free randy s_1000_1030)
    (free randy s_1100_1130)
    (free randy s_1230_1300)
    (free randy s_1330_1400)
    (free randy s_1400_1430)
    (free randy s_1530_1600)
    (free randy s_1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)