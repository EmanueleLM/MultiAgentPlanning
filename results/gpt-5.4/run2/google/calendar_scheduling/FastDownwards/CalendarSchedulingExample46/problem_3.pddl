(define (problem calendar_scheduling_example46_problem)
  (:domain calendar_scheduling_example46)

  (:objects
    arthur theresa carl - participant
    meeting_1 - meeting
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (requires_participant meeting_1 arthur)
    (requires_participant meeting_1 theresa)
    (requires_participant meeting_1 carl)
    (unscheduled meeting_1)

    (blocked arthur s_09_30)
    (blocked arthur s_14_00)

    (blocked theresa s_09_00)
    (blocked theresa s_12_00)
    (blocked theresa s_12_30)
    (blocked theresa s_15_00)
    (blocked theresa s_15_30)
    (blocked theresa s_16_00)

    (blocked carl s_09_00)
    (blocked carl s_09_30)
    (blocked carl s_10_00)
    (blocked carl s_10_30)
    (blocked carl s_11_00)
    (blocked carl s_12_00)
    (blocked carl s_12_30)
    (blocked carl s_13_00)
    (blocked carl s_13_30)
    (blocked carl s_14_30)
    (blocked carl s_15_00)
    (blocked carl s_15_30)
    (blocked carl s_16_00)
    (blocked carl s_16_30)

    (free arthur s_09_00)
    (free arthur s_10_00)
    (free arthur s_10_30)
    (free arthur s_11_00)
    (free arthur s_11_30)
    (free arthur s_12_00)
    (free arthur s_12_30)
    (free arthur s_13_00)
    (free arthur s_13_30)
    (free arthur s_14_30)
    (free arthur s_15_00)
    (free arthur s_15_30)
    (free arthur s_16_00)
    (free arthur s_16_30)

    (free theresa s_09_30)
    (free theresa s_10_00)
    (free theresa s_10_30)
    (free theresa s_11_00)
    (free theresa s_11_30)
    (free theresa s_13_00)
    (free theresa s_13_30)
    (free theresa s_14_00)
    (free theresa s_14_30)
    (free theresa s_16_30)

    (free carl s_11_30)
    (free carl s_14_00)
  )

  (:goal
    (and
      (scheduled_at meeting_1 s_11_30)
    )
  )
)