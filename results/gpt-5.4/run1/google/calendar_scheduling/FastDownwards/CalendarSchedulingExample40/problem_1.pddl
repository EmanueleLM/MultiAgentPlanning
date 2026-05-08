(define (problem schedule_meeting_1_monday)
  (:domain meeting_scheduler_monday_instance)

  (:objects
    meeting_1 - meeting
    monday_09_00 monday_09_30 monday_10_00 monday_10_30
    monday_11_00 monday_11_30 monday_12_00 monday_12_30
    monday_13_00 monday_13_30 monday_14_00 monday_14_30
    monday_15_00 monday_15_30 monday_16_00 monday_16_30 - timeslot
  )

  (:init
    (unscheduled meeting_1)

    (next_slot monday_09_00 monday_09_30)
    (next_slot monday_09_30 monday_10_00)
    (next_slot monday_10_00 monday_10_30)
    (next_slot monday_10_30 monday_11_00)
    (next_slot monday_11_00 monday_11_30)
    (next_slot monday_11_30 monday_12_00)
    (next_slot monday_12_00 monday_12_30)
    (next_slot monday_12_30 monday_13_00)
    (next_slot monday_13_00 monday_13_30)
    (next_slot monday_13_30 monday_14_00)
    (next_slot monday_14_00 monday_14_30)
    (next_slot monday_14_30 monday_15_00)
    (next_slot monday_15_00 monday_15_30)
    (next_slot monday_15_30 monday_16_00)
    (next_slot monday_16_00 monday_16_30)

    (free jacob monday_09_00)
    (free jacob monday_09_30)
    (free jacob monday_11_00)
    (free jacob monday_12_00)
    (free jacob monday_12_30)
    (free jacob monday_13_00)
    (free jacob monday_13_30)
    (free jacob monday_14_00)
    (free jacob monday_14_30)
    (free jacob monday_15_00)
    (free jacob monday_15_30)
    (free jacob monday_16_30)

    (free gabriel monday_09_00)
    (free gabriel monday_11_30)
    (free gabriel monday_12_00)
    (free gabriel monday_12_30)
    (free gabriel monday_13_30)
    (free gabriel monday_14_00)
    (free gabriel monday_14_30)
    (free gabriel monday_15_30)
    (free gabriel monday_16_00)
    (free gabriel monday_16_30)

    (free matthew monday_09_30)
    (free matthew monday_10_00)
    (free matthew monday_11_00)
    (free matthew monday_12_00)
    (free matthew monday_14_00)
    (free matthew monday_14_30)
    (free matthew monday_15_00)
    (free matthew monday_16_30)
  )

  (:goal
    (and
      (meeting_completed meeting_1)
    )
  )
)