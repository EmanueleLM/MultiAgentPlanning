(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    heather nicholas zachary - participant
    meeting_1 - meeting
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (required meeting_1 heather)
    (required meeting_1 nicholas)
    (required meeting_1 zachary)

    (available heather s_09_30)
    (available heather s_10_00)
    (available heather s_11_00)
    (available heather s_11_30)
    (available heather s_12_00)
    (available heather s_12_30)
    (available heather s_14_00)
    (available heather s_15_00)
    (available heather s_15_30)
    (available heather s_16_30)

    (available nicholas s_09_00)
    (available nicholas s_09_30)
    (available nicholas s_10_00)
    (available nicholas s_10_30)
    (available nicholas s_11_00)
    (available nicholas s_11_30)
    (available nicholas s_12_00)
    (available nicholas s_12_30)
    (available nicholas s_13_00)
    (available nicholas s_13_30)
    (available nicholas s_14_00)
    (available nicholas s_14_30)
    (available nicholas s_15_00)
    (available nicholas s_15_30)
    (available nicholas s_16_00)
    (available nicholas s_16_30)

    (available zachary s_10_30)
    (available zachary s_12_00)
    (available zachary s_13_00)
    (available zachary s_16_30)

    (allowed_start meeting_1 s_09_00)
    (allowed_start meeting_1 s_09_30)
    (allowed_start meeting_1 s_10_00)
    (allowed_start meeting_1 s_10_30)
    (allowed_start meeting_1 s_11_00)
    (allowed_start meeting_1 s_11_30)
    (allowed_start meeting_1 s_12_00)
    (allowed_start meeting_1 s_12_30)
    (allowed_start meeting_1 s_13_00)
    (allowed_start meeting_1 s_13_30)
    (allowed_start meeting_1 s_14_00)
  )

  (:goal
    (and
      (scheduled meeting_1)
      (scheduled_at meeting_1 s_12_00)
    )
  )
)