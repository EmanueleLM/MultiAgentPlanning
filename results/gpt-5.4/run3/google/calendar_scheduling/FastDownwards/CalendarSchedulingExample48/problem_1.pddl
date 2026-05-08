(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    i_1330_1430
    i_1400_1500
    i_1430_1530
    i_1500_1600
    i_1530_1630
    i_1600_1700 - interval
  )

  (:init
    (meeting_unscheduled)

    (allowed_interval i_1330_1430)
    (allowed_interval i_1400_1500)
    (allowed_interval i_1430_1530)
    (allowed_interval i_1500_1600)
    (allowed_interval i_1530_1630)
    (allowed_interval i_1600_1700)

    (available janet i_1430_1530)
    (available janet i_1500_1600)
    (available janet i_1530_1630)
    (available janet i_1600_1700)

    (available rachel i_1330_1430)
    (available rachel i_1400_1500)
    (available rachel i_1430_1530)
    (available rachel i_1500_1600)
    (available rachel i_1530_1630)
    (available rachel i_1600_1700)

    (available cynthia i_1430_1530)
    (available cynthia i_1500_1600)
  )

  (:goal
    (and
      (meeting_scheduled)
      (not (meeting_unscheduled))
      (or
        (scheduled i_1430_1530)
        (scheduled i_1500_1600)
      )
    )
  )
)