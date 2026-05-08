(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    diana ethan janet - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (open)

    (allowed_start s_09_00)
    (allowed_start s_09_30)
    (allowed_start s_10_00)
    (allowed_start s_10_30)
    (allowed_start s_11_00)
    (allowed_start s_11_30)

    (free diana s_09_00)
    (free diana s_09_30)
    (free diana s_10_00)
    (free diana s_10_30)
    (free diana s_11_00)
    (free diana s_12_00)
    (free diana s_12_30)
    (free diana s_13_30)
    (free diana s_14_00)
    (free diana s_14_30)
    (free diana s_15_00)
    (free diana s_15_30)
    (free diana s_16_00)
    (free diana s_16_30)

    (free ethan s_09_00)
    (free ethan s_09_30)
    (free ethan s_10_00)
    (free ethan s_10_30)
    (free ethan s_11_00)
    (free ethan s_11_30)
    (free ethan s_12_00)
    (free ethan s_12_30)
    (free ethan s_13_00)
    (free ethan s_13_30)
    (free ethan s_14_00)
    (free ethan s_14_30)
    (free ethan s_15_00)
    (free ethan s_15_30)
    (free ethan s_16_00)
    (free ethan s_16_30)

    (free janet s_10_00)
    (free janet s_10_30)
    (free janet s_11_00)
    (free janet s_11_30)
    (free janet s_12_00)
    (free janet s_13_00)
    (free janet s_13_30)
    (free janet s_15_00)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)