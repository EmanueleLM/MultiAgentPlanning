(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    brittany emily doris - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
    meeting_1 - meeting
  )

  (:init
    (required_participant meeting_1 brittany)
    (required_participant meeting_1 emily)
    (required_participant meeting_1 doris)

    (free brittany s_09_00)
    (free brittany s_09_30)
    (free brittany s_10_00)
    (free brittany s_10_30)
    (free brittany s_11_00)
    (free brittany s_11_30)
    (free brittany s_12_00)
    (free brittany s_12_30)
    (free brittany s_13_30)
    (free brittany s_14_00)
    (free brittany s_14_30)
    (free brittany s_15_00)
    (free brittany s_15_30)
    (free brittany s_16_30)

    (free emily s_09_00)
    (free emily s_09_30)
    (free emily s_10_00)
    (free emily s_10_30)
    (free emily s_11_00)
    (free emily s_11_30)
    (free emily s_12_00)
    (free emily s_12_30)
    (free emily s_13_00)
    (free emily s_13_30)
    (free emily s_14_00)
    (free emily s_14_30)
    (free emily s_15_00)
    (free emily s_15_30)
    (free emily s_16_00)
    (free emily s_16_30)

    (free doris s_11_00)
    (free doris s_14_30)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)