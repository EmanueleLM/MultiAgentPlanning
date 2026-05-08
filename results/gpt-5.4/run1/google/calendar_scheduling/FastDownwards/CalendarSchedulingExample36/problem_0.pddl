(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    ryan ruth denise - participant
    w_09_00_10_00
    w_09_30_10_30
    w_10_00_11_00
    w_10_30_11_30
    w_11_00_12_00
    w_11_30_12_30
    w_12_00_13_00
    w_12_30_13_30
    w_13_00_14_00
    w_13_30_14_30
    w_14_00_15_00
    w_14_30_15_30
    w_15_00_16_00
    w_15_30_16_30
    w_16_00_17_00 - window
  )

  (:init
    (feasible w_10_30_11_30)
    (feasible w_11_00_12_00)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)