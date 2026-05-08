(define (problem schedule_meeting_richard_martha_kimberly_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    richard martha kimberly - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
    meeting_1 - meeting
  )

  (:init
    (meeting_unscheduled meeting_1)

    (slot_allowed meeting_1 s_14_00)
    (slot_allowed meeting_1 s_14_30)
    (slot_allowed meeting_1 s_15_00)
    (slot_allowed meeting_1 s_15_30)
    (slot_allowed meeting_1 s_16_00)
    (slot_allowed meeting_1 s_16_30)

    (participant_free richard s_09_00)
    (participant_free richard s_09_30)
    (participant_free richard s_10_00)
    (participant_free richard s_10_30)
    (participant_free richard s_11_00)
    (participant_free richard s_11_30)
    (participant_free richard s_12_00)
    (participant_free richard s_12_30)
    (participant_free richard s_13_00)
    (participant_free richard s_14_00)
    (participant_free richard s_14_30)
    (participant_free richard s_15_30)
    (participant_free richard s_16_00)
    (participant_free richard s_16_30)

    (participant_free martha s_09_30)
    (participant_free martha s_10_00)
    (participant_free martha s_10_30)
    (participant_free martha s_11_00)
    (participant_free martha s_11_30)
    (participant_free martha s_12_00)
    (participant_free martha s_12_30)
    (participant_free martha s_13_30)
    (participant_free martha s_14_00)
    (participant_free martha s_14_30)
    (participant_free martha s_15_00)
    (participant_free martha s_15_30)
    (participant_free martha s_16_00)
    (participant_free martha s_16_30)

    (participant_free kimberly s_11_00)
    (participant_free kimberly s_12_00)
    (participant_free kimberly s_13_00)
    (participant_free kimberly s_13_30)
    (participant_free kimberly s_16_00)
    (participant_free kimberly s_16_30)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)