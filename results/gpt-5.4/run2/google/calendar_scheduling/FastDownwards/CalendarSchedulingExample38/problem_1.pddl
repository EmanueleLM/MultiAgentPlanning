(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
    meeting_1 - meeting
  )

  (:init
    (meeting_unscheduled meeting_1)

    (available catherine s_09_00)
    (available catherine s_09_30)
    (available catherine s_10_00)
    (available catherine s_11_00)
    (available catherine s_11_30)
    (available catherine s_12_00)
    (available catherine s_13_30)
    (available catherine s_14_00)
    (available catherine s_15_00)
    (available catherine s_15_30)
    (available catherine s_16_00)
    (available catherine s_16_30)

    (available michael s_09_00)
    (available michael s_10_30)
    (available michael s_11_00)
    (available michael s_11_30)
    (available michael s_13_00)
    (available michael s_14_00)
    (available michael s_14_30)
    (available michael s_15_30)
    (available michael s_16_00)
    (available michael s_16_30)

    (available alexander s_09_30)
    (available alexander s_10_30)
    (available alexander s_12_00)
    (available alexander s_12_30)
    (available alexander s_13_30)
    (available alexander s_16_00)
  )

  (:goal
    (and
      (scheduled_at meeting_1 s_16_00)
    )
  )
)