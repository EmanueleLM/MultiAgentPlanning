(define (problem schedule-2025-10-21)
  (:domain earliest-meeting)
  (:objects
    alice bob carol - person
    slot_09_00 slot_09_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )
  (:init
    (available alice slot_09_00)
    (available alice slot_09_30)
    (available alice slot_10_00)
    (available alice slot_10_30)
    (available alice slot_13_00)
    (available alice slot_13_30)
    (available alice slot_14_00)
    (available alice slot_14_30)
    (available alice slot_15_00)
    (available alice slot_15_30)

    (available bob slot_10_30)
    (available bob slot_11_00)
    (available bob slot_11_30)
    (available bob slot_14_00)
    (available bob slot_14_30)
    (available bob slot_15_00)

    (available carol slot_09_30)
    (available carol slot_10_00)
    (available carol slot_11_00)
    (available carol slot_11_30)
    (available carol slot_12_00)
    (available carol slot_15_00)
    (available carol slot_15_30)
    (available carol slot_16_00)
    (available carol slot_16_30)

    (all-available slot_15_00)
  )
  (:goal (and
    (meeting-scheduled)
    (scheduled slot_15_00)
  ))
)