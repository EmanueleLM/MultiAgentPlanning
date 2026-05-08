(define (problem calendar_scheduling_example5_problem)
  (:domain calendar_scheduling_example5)

  (:objects
    kathryn charlotte lauren - participant
    meeting_1 - meeting
    monday_09_00 monday_09_30 monday_10_00 monday_10_30
    monday_11_00 monday_11_30 monday_12_00 monday_12_30
    monday_13_00 monday_13_30 monday_14_00 monday_14_30
    monday_15_00 monday_15_30 monday_16_00 monday_16_30 - timeslot
  )

  (:init
    (meeting_pending meeting_1)

    (requires_participant meeting_1 kathryn)
    (requires_participant meeting_1 charlotte)
    (requires_participant meeting_1 lauren)

    (allowed_start meeting_1 monday_09_00)
    (allowed_start meeting_1 monday_09_30)
    (allowed_start meeting_1 monday_10_00)
    (allowed_start meeting_1 monday_10_30)
    (allowed_start meeting_1 monday_11_00)
    (allowed_start meeting_1 monday_11_30)
    (allowed_start meeting_1 monday_12_00)
    (allowed_start meeting_1 monday_12_30)
    (allowed_start meeting_1 monday_13_00)
    (allowed_start meeting_1 monday_13_30)

    (free kathryn monday_09_30)
    (free kathryn monday_10_00)
    (free kathryn monday_11_00)
    (free kathryn monday_12_00)
    (free kathryn monday_12_30)
    (free kathryn monday_13_00)
    (free kathryn monday_14_30)
    (free kathryn monday_15_00)
    (free kathryn monday_15_30)
    (free kathryn monday_16_00)

    (free charlotte monday_09_00)
    (free charlotte monday_09_30)
    (free charlotte monday_10_00)
    (free charlotte monday_10_30)
    (free charlotte monday_11_00)
    (free charlotte monday_11_30)
    (free charlotte monday_12_30)
    (free charlotte monday_13_00)
    (free charlotte monday_13_30)
    (free charlotte monday_14_00)
    (free charlotte monday_14_30)
    (free charlotte monday_15_00)
    (free charlotte monday_15_30)
    (free charlotte monday_16_30)

    (free lauren monday_10_00)
    (free lauren monday_10_30)
    (free lauren monday_11_00)
    (free lauren monday_11_30)
    (free lauren monday_12_30)
    (free lauren monday_13_00)
    (free lauren monday_14_30)
    (free lauren monday_16_00)
  )

  (:goal
    (scheduled_at meeting_1 monday_10_00)
  )
)