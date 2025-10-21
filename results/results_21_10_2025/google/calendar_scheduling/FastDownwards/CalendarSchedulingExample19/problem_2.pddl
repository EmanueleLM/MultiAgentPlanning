(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-30min)

  (:objects
    stephen edward angela - participant
    slot_09_00 slot_09_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30 slot_15_00 slot_15_30 slot_16_00 - slot
    meeting1 - meeting
  )

  (:init
    (available stephen slot_09_00)
    (available stephen slot_10_30)
    (available stephen slot_11_00)
    (available stephen slot_11_30)
    (available stephen slot_12_00)
    (available stephen slot_13_30)
    (available stephen slot_15_00)

    (available edward slot_10_30)
    (available edward slot_11_00)
    (available edward slot_11_30)
    (available edward slot_12_00)
    (available edward slot_12_30)
    (available edward slot_16_00)

    (available angela slot_11_30)
  )

  (:goal (scheduled meeting1))
)