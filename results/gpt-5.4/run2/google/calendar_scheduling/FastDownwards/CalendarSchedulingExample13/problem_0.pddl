(define (problem meeting_schedule_gerald_roy_barbara_monday)
  (:domain meeting_schedule_monday_half_hour)

  (:objects
    gerald roy barbara - participant
    meeting_gerald_roy_barbara - meeting
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (unscheduled meeting_gerald_roy_barbara)

    (requires meeting_gerald_roy_barbara gerald)
    (requires meeting_gerald_roy_barbara roy)
    (requires meeting_gerald_roy_barbara barbara)

    (acceptable_slot meeting_gerald_roy_barbara s_13_00)
    (acceptable_slot meeting_gerald_roy_barbara s_13_30)
    (acceptable_slot meeting_gerald_roy_barbara s_14_00)
    (acceptable_slot meeting_gerald_roy_barbara s_14_30)
    (acceptable_slot meeting_gerald_roy_barbara s_15_00)
    (acceptable_slot meeting_gerald_roy_barbara s_15_30)
    (acceptable_slot meeting_gerald_roy_barbara s_16_00)
    (acceptable_slot meeting_gerald_roy_barbara s_16_30)

    (participant_free gerald s_09_30)
    (participant_free gerald s_10_00)
    (participant_free gerald s_10_30)
    (participant_free gerald s_11_00)
    (participant_free gerald s_11_30)
    (participant_free gerald s_12_00)
    (participant_free gerald s_12_30)
    (participant_free gerald s_14_00)
    (participant_free gerald s_14_30)
    (participant_free gerald s_15_30)

    (participant_free roy s_09_00)
    (participant_free roy s_09_30)
    (participant_free roy s_10_00)
    (participant_free roy s_10_30)
    (participant_free roy s_11_00)
    (participant_free roy s_11_30)
    (participant_free roy s_12_00)
    (participant_free roy s_12_30)
    (participant_free roy s_13_00)
    (participant_free roy s_13_30)
    (participant_free roy s_14_00)
    (participant_free roy s_14_30)
    (participant_free roy s_15_00)
    (participant_free roy s_15_30)
    (participant_free roy s_16_00)
    (participant_free roy s_16_30)

    (participant_free barbara s_09_00)
    (participant_free barbara s_10_00)
    (participant_free barbara s_10_30)
    (participant_free barbara s_11_00)
    (participant_free barbara s_14_00)
    (participant_free barbara s_15_00)
  )

  (:goal
    (and
      (scheduled meeting_gerald_roy_barbara s_14_00)
      (not (unscheduled meeting_gerald_roy_barbara))
    )
  )
)