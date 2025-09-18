(define (problem schedule-meeting-roy-kathryn-amy)
  (:domain meeting-scheduling)
  (:objects
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )
  (:init
    (free roy slot_9_30) (free roy slot_10_30) (free roy slot_11_30)
    (free roy slot_12_00) (free roy slot_13_00) (free roy slot_13_30)
    (free roy slot_14_00) (free roy slot_14_30) (free roy slot_15_00)
    (free roy slot_15_30) (free roy slot_16_00) (free roy slot_16_30)
    (free kathryn slot_9_00) (free kathryn slot_10_00) (free kathryn slot_10_30)
    (free kathryn slot_11_00) (free kathryn slot_11_30) (free kathryn slot_12_00)
    (free kathryn slot_12_30) (free kathryn slot_13_00) (free kathryn slot_13_30)
    (free kathryn slot_14_00) (free kathryn slot_14_30) (free kathryn slot_15_00)
    (free kathryn slot_15_30) (free kathryn slot_16_00)
    (free amy slot_14_30) (free amy slot_16_00)
    (preferred-amy slot_14_30)
  )
  (:goal (meeting-scheduled slot_14_30))
)