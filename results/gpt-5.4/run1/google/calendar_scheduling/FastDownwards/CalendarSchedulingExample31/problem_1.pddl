(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

    (allowed_slot s_14_00)
    (allowed_slot s_14_30)
    (allowed_slot s_15_00)
    (allowed_slot s_15_30)
    (allowed_slot s_16_00)
    (allowed_slot s_16_30)

    (free richard s_09_00)
    (free richard s_09_30)
    (free richard s_10_00)
    (free richard s_10_30)
    (free richard s_11_00)
    (free richard s_11_30)
    (free richard s_12_00)
    (free richard s_12_30)
    (free richard s_13_00)
    (free richard s_14_00)
    (free richard s_14_30)
    (free richard s_15_30)
    (free richard s_16_00)
    (free richard s_16_30)

    (free martha s_09_30)
    (free martha s_10_00)
    (free martha s_10_30)
    (free martha s_11_00)
    (free martha s_11_30)
    (free martha s_12_00)
    (free martha s_12_30)
    (free martha s_13_30)
    (free martha s_14_00)
    (free martha s_14_30)
    (free martha s_15_00)
    (free martha s_15_30)
    (free martha s_16_00)
    (free martha s_16_30)

    (free kimberly s_11_00)
    (free kimberly s_12_00)
    (free kimberly s_13_00)
    (free kimberly s_13_30)
    (free kimberly s_16_00)
    (free kimberly s_16_30)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)