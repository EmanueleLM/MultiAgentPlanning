(define (problem schedule_meeting_gerald_roy_barbara_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    gerald roy barbara - participant
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - slot
    meeting_gerald_roy_barbara - meeting
  )

  (:init
    (unscheduled meeting_gerald_roy_barbara)

    (required meeting_gerald_roy_barbara gerald)
    (required meeting_gerald_roy_barbara roy)
    (required meeting_gerald_roy_barbara barbara)

    (work_slot t_0900_0930)
    (work_slot t_0930_1000)
    (work_slot t_1000_1030)
    (work_slot t_1030_1100)
    (work_slot t_1100_1130)
    (work_slot t_1130_1200)
    (work_slot t_1200_1230)
    (work_slot t_1230_1300)
    (work_slot t_1300_1330)
    (work_slot t_1330_1400)
    (work_slot t_1400_1430)
    (work_slot t_1430_1500)
    (work_slot t_1500_1530)
    (work_slot t_1530_1600)
    (work_slot t_1600_1630)
    (work_slot t_1630_1700)

    (preferred_slot meeting_gerald_roy_barbara t_1300_1330)
    (preferred_slot meeting_gerald_roy_barbara t_1330_1400)
    (preferred_slot meeting_gerald_roy_barbara t_1400_1430)
    (preferred_slot meeting_gerald_roy_barbara t_1430_1500)
    (preferred_slot meeting_gerald_roy_barbara t_1500_1530)
    (preferred_slot meeting_gerald_roy_barbara t_1530_1600)
    (preferred_slot meeting_gerald_roy_barbara t_1600_1630)
    (preferred_slot meeting_gerald_roy_barbara t_1630_1700)

    (free gerald t_0930_1000)
    (free gerald t_1000_1030)
    (free gerald t_1030_1100)
    (free gerald t_1100_1130)
    (free gerald t_1130_1200)
    (free gerald t_1200_1230)
    (free gerald t_1230_1300)
    (free gerald t_1400_1430)
    (free gerald t_1430_1500)
    (free gerald t_1530_1600)

    (free roy t_0900_0930)
    (free roy t_0930_1000)
    (free roy t_1000_1030)
    (free roy t_1030_1100)
    (free roy t_1100_1130)
    (free roy t_1130_1200)
    (free roy t_1200_1230)
    (free roy t_1230_1300)
    (free roy t_1300_1330)
    (free roy t_1330_1400)
    (free roy t_1400_1430)
    (free roy t_1430_1500)
    (free roy t_1500_1530)
    (free roy t_1530_1600)
    (free roy t_1600_1630)
    (free roy t_1630_1700)

    (free barbara t_0900_0930)
    (free barbara t_1000_1030)
    (free barbara t_1030_1100)
    (free barbara t_1100_1130)
    (free barbara t_1400_1430)
    (free barbara t_1500_1530)
  )

  (:goal
    (and
      (scheduled meeting_gerald_roy_barbara)
      (scheduled_at meeting_gerald_roy_barbara t_1400_1430)
    )
  )
)