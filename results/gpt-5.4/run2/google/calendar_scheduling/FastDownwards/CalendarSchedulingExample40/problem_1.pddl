(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
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
    meeting_1 - meeting
  )

  (:init
    (required_attendee meeting_1 jacob)
    (required_attendee meeting_1 gabriel)
    (required_attendee meeting_1 matthew)

    (hour_window s_0900_0930 s_0930_1000)
    (hour_window s_0930_1000 s_1000_1030)
    (hour_window s_1000_1030 s_1030_1100)
    (hour_window s_1030_1100 s_1100_1130)
    (hour_window s_1100_1130 s_1130_1200)
    (hour_window s_1130_1200 s_1200_1230)
    (hour_window s_1200_1230 s_1230_1300)
    (hour_window s_1230_1300 s_1300_1330)
    (hour_window s_1300_1330 s_1330_1400)
    (hour_window s_1330_1400 s_1400_1430)
    (hour_window s_1400_1430 s_1430_1500)
    (hour_window s_1430_1500 s_1500_1530)
    (hour_window s_1500_1530 s_1530_1600)
    (hour_window s_1530_1600 s_1600_1630)
    (hour_window s_1600_1630 s_1630_1700)

    (busy jacob s_1000_1030)
    (busy jacob s_1030_1100)
    (busy jacob s_1130_1200)
    (busy jacob s_1600_1630)

    (busy gabriel s_0930_1000)
    (busy gabriel s_1000_1030)
    (busy gabriel s_1030_1100)
    (busy gabriel s_1100_1130)
    (busy gabriel s_1300_1330)
    (busy gabriel s_1500_1530)

    (busy matthew s_0900_0930)
    (busy matthew s_1030_1100)
    (busy matthew s_1130_1200)
    (busy matthew s_1230_1300)
    (busy matthew s_1300_1330)
    (busy matthew s_1330_1400)
    (busy matthew s_1530_1600)
    (busy matthew s_1600_1630)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)