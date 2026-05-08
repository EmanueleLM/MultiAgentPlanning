(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    gregory teresa carol - participant
    monday - day
    s_09_00_09_30
    s_09_30_10_00
    s_10_00_10_30
    s_10_30_11_00
    s_11_00_11_30
    s_11_30_12_00
    s_12_00_12_30
    s_12_30_13_00
    s_13_00_13_30
    s_13_30_14_00
    s_14_00_14_30
    s_14_30_15_00
    s_15_00_15_30
    s_15_30_16_00
    s_16_00_16_30
    s_16_30_17_00 - slot
  )

  (:init
    (unscheduled)

    (slot_on_day s_09_00_09_30 monday)
    (slot_on_day s_09_30_10_00 monday)
    (slot_on_day s_10_00_10_30 monday)
    (slot_on_day s_10_30_11_00 monday)
    (slot_on_day s_11_00_11_30 monday)
    (slot_on_day s_11_30_12_00 monday)
    (slot_on_day s_12_00_12_30 monday)
    (slot_on_day s_12_30_13_00 monday)
    (slot_on_day s_13_00_13_30 monday)
    (slot_on_day s_13_30_14_00 monday)
    (slot_on_day s_14_00_14_30 monday)
    (slot_on_day s_14_30_15_00 monday)
    (slot_on_day s_15_00_15_30 monday)
    (slot_on_day s_15_30_16_00 monday)
    (slot_on_day s_16_00_16_30 monday)
    (slot_on_day s_16_30_17_00 monday)

    (free gregory s_09_00_09_30)
    (free gregory s_09_30_10_00)
    (free gregory s_10_00_10_30)
    (free gregory s_10_30_11_00)
    (free gregory s_11_30_12_00)
    (free gregory s_12_30_13_00)
    (free gregory s_13_00_13_30)
    (free gregory s_13_30_14_00)
    (free gregory s_14_00_14_30)
    (free gregory s_14_30_15_00)
    (free gregory s_15_00_15_30)
    (free gregory s_16_30_17_00)

    (free teresa s_09_00_09_30)
    (free teresa s_09_30_10_00)
    (free teresa s_10_00_10_30)
    (free teresa s_10_30_11_00)
    (free teresa s_11_00_11_30)
    (free teresa s_11_30_12_00)
    (free teresa s_12_00_12_30)
    (free teresa s_12_30_13_00)
    (free teresa s_13_00_13_30)
    (free teresa s_13_30_14_00)
    (free teresa s_14_00_14_30)
    (free teresa s_14_30_15_00)
    (free teresa s_15_00_15_30)
    (free teresa s_15_30_16_00)
    (free teresa s_16_00_16_30)
    (free teresa s_16_30_17_00)

    (free carol s_10_30_11_00)
    (free carol s_16_00_16_30)
  )

  (:goal
    (exists (?s - slot)
      (scheduled ?s)
    )
  )
)