(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    meeting_1 - meeting
    s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230
    s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - slot
  )

  (:init
    (unscheduled meeting_1)
    (feasible_start s_1000)
  )

  (:goal
    (and
      (scheduled meeting_1)
      (scheduled_at meeting_1 s_1000)
    )
  )
)