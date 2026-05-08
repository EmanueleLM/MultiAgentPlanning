(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    diane kelly deborah - participant
    meeting_1 - meeting
    monday - day
    slot_09_00_09_30
    slot_09_30_10_00
    slot_10_00_10_30
    slot_10_30_11_00
    slot_11_00_11_30
    slot_11_30_12_00
    slot_12_00_12_30
    slot_12_30_13_00
    slot_13_00_13_30
    slot_13_30_14_00
    slot_14_00_14_30
    slot_14_30_15_00
    slot_15_00_15_30
    slot_15_30_16_00
    slot_16_00_16_30
    slot_16_30_17_00 - slot
  )

  (:init
    (requires meeting_1 diane)
    (requires meeting_1 kelly)
    (requires meeting_1 deborah)

    (slot_in_workday monday slot_09_00_09_30)
    (slot_in_workday monday slot_09_30_10_00)
    (slot_in_workday monday slot_10_00_10_30)
    (slot_in_workday monday slot_10_30_11_00)
    (slot_in_workday monday slot_11_00_11_30)
    (slot_in_workday monday slot_11_30_12_00)
    (slot_in_workday monday slot_12_00_12_30)
    (slot_in_workday monday slot_12_30_13_00)
    (slot_in_workday monday slot_13_00_13_30)
    (slot_in_workday monday slot_13_30_14_00)
    (slot_in_workday monday slot_14_00_14_30)
    (slot_in_workday monday slot_14_30_15_00)
    (slot_in_workday monday slot_15_00_15_30)
    (slot_in_workday monday slot_15_30_16_00)
    (slot_in_workday monday slot_16_00_16_30)
    (slot_in_workday monday slot_16_30_17_00)

    (busy diane monday slot_09_00_09_30)
    (busy diane monday slot_12_00_12_30)
    (busy diane monday slot_14_30_15_00)
    (busy diane monday slot_15_00_15_30)

    (busy kelly monday slot_09_30_10_00)
    (busy kelly monday slot_10_30_11_00)

    (busy deborah monday slot_09_00_09_30)
    (busy deborah monday slot_10_00_10_30)
    (busy deborah monday slot_10_30_11_00)
    (busy deborah monday slot_11_00_11_30)
    (busy deborah monday slot_11_30_12_00)
    (busy deborah monday slot_12_00_12_30)
    (busy deborah monday slot_12_30_13_00)
    (busy deborah monday slot_13_00_13_30)
    (busy deborah monday slot_13_30_14_00)
    (busy deborah monday slot_14_30_15_00)
    (busy deborah monday slot_15_00_15_30)
    (busy deborah monday slot_15_30_16_00)
    (busy deborah monday slot_16_00_16_30)
    (busy deborah monday slot_16_30_17_00)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)