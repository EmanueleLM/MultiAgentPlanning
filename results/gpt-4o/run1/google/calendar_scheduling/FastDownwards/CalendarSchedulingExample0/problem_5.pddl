(define (problem schedule_meeting_example)
  (:domain meeting_schedule)

  (:objects
    michelle steven jerry - participant
    monday - day
    time_slot_9_00_to_10_00 time_slot_10_00_to_11_00 time_slot_11_00_to_12_00
    time_slot_12_00_to_13_00 time_slot_13_00_to_14_00 time_slot_14_00_to_15_00
    time_slot_15_00_to_16_00 time_slot_16_00_to_17_00 - time_slot
  )

  (:init
    (within_work_hours time_slot_9_00_to_10_00)
    (within_work_hours time_slot_10_00_to_11_00)
    (within_work_hours time_slot_11_00_to_12_00)
    (within_work_hours time_slot_12_00_to_13_00)
    (within_work_hours time_slot_13_00_to_14_00)
    (within_work_hours time_slot_14_00_to_15_00)
    (within_work_hours time_slot_15_00_to_16_00)
    (within_work_hours time_slot_16_00_to_17_00)

    (available michelle time_slot_9_00_to_10_00)
    (available michelle time_slot_10_00_to_11_00)
    (available michelle time_slot_12_00_to_13_00)
    (available michelle time_slot_13_00_to_14_00)
    (available michelle time_slot_14_00_to_15_00)
    (available michelle time_slot_15_00_to_16_00)

    (available steven time_slot_10_00_to_11_00)
    (available steven time_slot_12_00_to_13_00)
    (available steven time_slot_14_00_to_15_00)
    (available steven time_slot_16_00_to_17_00)

    (available jerry time_slot_11_00_to_12_00)
    (available jerry time_slot_12_00_to_13_00)
    (available jerry time_slot_14_00_to_15_00)
    (available jerry time_slot_16_00_to_17_00)
  )

  (:goal (and
    (meeting_scheduled michelle)
    (meeting_scheduled steven)
    (meeting_scheduled jerry)
  ))
)