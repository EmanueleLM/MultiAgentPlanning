(define (problem schedule-monday)
  (:domain meeting-schedule)
  (:objects
    karen brandon donald kelly - agent
    slot_09_00_09_30 slot_09_30_10_00 slot_10_00_10_30 slot_10_30_11_00
    slot_11_00_11_30 slot_11_30_12_00 slot_12_00_12_30 slot_12_30_13_00
    slot_13_00_13_30 slot_13_30_14_00 slot_14_00_14_30 slot_14_30_15_00
    slot_15_00_15_30 slot_15_30_16_00 slot_16_00_16_30 slot_16_30_17_00 - slot
  )

  (:init
    (free karen slot_10_30_11_00)
    (free karen slot_11_00_11_30)
    (free karen slot_11_30_12_00)
    (free karen slot_12_00_12_30)
    (free karen slot_12_30_13_00)
    (free karen slot_13_00_13_30)
    (free karen slot_13_30_14_00)
    (free karen slot_14_00_14_30)
    (free karen slot_14_30_15_00)
    (free karen slot_15_00_15_30)
    (free karen slot_15_30_16_00)
    (free karen slot_16_00_16_30)

    (free brandon slot_09_00_09_30)
    (free brandon slot_10_00_10_30)
    (free brandon slot_11_00_11_30)
    (free brandon slot_12_30_13_00)
    (free brandon slot_13_00_13_30)
    (free brandon slot_13_30_14_00)
    (free brandon slot_14_00_14_30)
    (free brandon slot_14_30_15_00)
    (free brandon slot_15_00_15_30)
    (free brandon slot_16_00_16_30)

    (free donald slot_10_30_11_00)
    (free donald slot_14_00_14_30)

    (free kelly slot_09_30_10_00)
    (free kelly slot_10_00_10_30)
    (free kelly slot_11_00_11_30)
    (free kelly slot_12_00_12_30)
    (free kelly slot_12_30_13_00)
    (free kelly slot_13_00_13_30)
    (free kelly slot_14_00_14_30)
    (free kelly slot_15_30_16_00)

    (not-scheduled)
  )

  (:goal (meeting-scheduled slot_14_00_14_30))
)