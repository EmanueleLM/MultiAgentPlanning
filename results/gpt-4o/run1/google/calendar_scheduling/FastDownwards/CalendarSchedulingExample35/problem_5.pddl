(define (problem calendar_scheduling_example)
  (:domain calendar_scheduling)
  (:objects
    bradley zachary teresa - participant
    slot_9_00_to_9_30 slot_9_30_to_10_00 slot_10_00_to_10_30
    slot_10_30_to_11_00 slot_11_00_to_11_30 slot_11_30_to_12_00
    slot_12_00_to_12_30 slot_12_30_to_13_00 slot_13_00_to_13_30
    slot_13_30_to_14_00 slot_14_00_to_14_30 slot_14_30_to_15_00
    slot_15_00_to_15_30 slot_15_30_to_16_00 slot_16_00_to_16_30
    slot_16_30_to_17_00 - time_slot)
  (:init
    ;; Bradley's availability
    (available bradley slot_14_30_to_15_00)
    (available bradley slot_15_00_to_15_30)
    (available bradley slot_15_30_to_16_00)
    (available bradley slot_16_00_to_16_30)
    (available bradley slot_16_30_to_17_00)

    ;; Zachary's availability
    (available zachary slot_9_00_to_9_30)
    (available zachary slot_9_30_to_10_00)
    (available zachary slot_10_30_to_11_00)
    (available zachary slot_11_00_to_11_30)
    (available zachary slot_11_30_to_12_00)
    (available zachary slot_12_00_to_12_30)
    (available zachary slot_12_30_to_13_00)
    (available zachary slot_13_00_to_13_30)
    (available zachary slot_13_30_to_14_00)
    (available zachary slot_14_30_to_15_00)
    (available zachary slot_15_30_to_16_00)
    (available zachary slot_16_00_to_16_30)
    (available zachary slot_16_30_to_17_00)

    ;; Teresa's availability
    (available teresa slot_10_30_to_11_00)
    (available teresa slot_12_30_to_13_00)
    (available teresa slot_13_30_to_14_00)
    (available teresa slot_16_30_to_17_00)
  )
  (:goal
    (exists (?s - time_slot) (meeting_scheduled ?s)))
)