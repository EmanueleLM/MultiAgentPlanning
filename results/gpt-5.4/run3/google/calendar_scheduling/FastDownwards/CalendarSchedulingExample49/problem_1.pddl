(define (problem monday_meeting_teresa_kathleen_patricia)
  (:domain monday_meeting_scheduling)

  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (unscheduled)

    (free teresa s_10_00)
    (free teresa s_10_30)
    (free teresa s_11_00)
    (free teresa s_11_30)
    (free teresa s_12_00)
    (free teresa s_12_30)
    (free teresa s_13_30)
    (free teresa s_14_30)
    (free teresa s_15_30)
    (free teresa s_16_00)

    (free kathleen s_09_30)
    (free kathleen s_10_00)
    (free kathleen s_10_30)
    (free kathleen s_11_00)
    (free kathleen s_11_30)
    (free kathleen s_12_00)
    (free kathleen s_13_00)
    (free kathleen s_14_00)
    (free kathleen s_14_30)
    (free kathleen s_15_30)
    (free kathleen s_16_00)
    (free kathleen s_16_30)

    (free patricia s_10_30)
    (free patricia s_11_00)
    (free patricia s_12_00)
    (free patricia s_12_30)
    (free patricia s_13_30)
    (free patricia s_14_30)
    (free patricia s_15_00)
    (free patricia s_16_00)

    (allowed_for_kathleen s_09_00)
    (allowed_for_kathleen s_09_30)
    (allowed_for_kathleen s_10_00)
    (allowed_for_kathleen s_10_30)
    (allowed_for_kathleen s_11_00)
    (allowed_for_kathleen s_11_30)
    (allowed_for_kathleen s_12_00)
    (allowed_for_kathleen s_12_30)
    (allowed_for_kathleen s_13_00)
    (allowed_for_kathleen s_13_30)
    (allowed_for_kathleen s_14_00)
    (allowed_for_kathleen s_14_30)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)