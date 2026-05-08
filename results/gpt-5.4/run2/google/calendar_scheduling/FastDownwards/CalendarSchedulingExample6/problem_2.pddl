(define (problem calendar_scheduling_example6_problem)
  (:domain calendar_scheduling_example6)

  (:objects
    thomas dylan jerry - participant
    meeting_1 - meeting
    s_0900_1000
    s_0930_1030
    s_1000_1100
    s_1030_1130
    s_1100_1200
    s_1130_1230
    s_1200_1300
    s_1230_1330
    s_1300_1400
    s_1330_1430
    s_1400_1500
    s_1430_1530
    s_1500_1600
    s_1530_1630
    s_1600_1700 - slot
  )

  (:init
    (required_attendee meeting_1 thomas)
    (required_attendee meeting_1 dylan)
    (required_attendee meeting_1 jerry)

    (free thomas s_0900_1000)
    (free thomas s_0930_1030)
    (free thomas s_1000_1100)
    (free thomas s_1030_1130)
    (free thomas s_1100_1200)
    (free thomas s_1130_1230)
    (free thomas s_1200_1300)
    (free thomas s_1230_1330)
    (free thomas s_1300_1400)
    (free thomas s_1330_1430)
    (free thomas s_1400_1500)
    (free thomas s_1430_1530)
    (free thomas s_1500_1600)
    (free thomas s_1530_1630)
    (free thomas s_1600_1700)

    (free dylan s_0900_1000)
    (free dylan s_1100_1200)
    (free dylan s_1130_1230)
    (free dylan s_1200_1300)
    (free dylan s_1430_1530)
    (free dylan s_1500_1600)
    (free dylan s_1530_1630)
    (free dylan s_1600_1700)

    (free jerry s_1430_1530)
    (free jerry s_1500_1600)
  )

  (:goal
    (or
      (scheduled_in meeting_1 s_1430_1530)
      (scheduled_in meeting_1 s_1500_1600)
    )
  )
)