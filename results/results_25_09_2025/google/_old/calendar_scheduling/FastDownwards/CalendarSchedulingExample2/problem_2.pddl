(define (problem schedule-meeting-roy-kathryn-amy)
  (:domain meeting-scheduling)

  (:objects
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30
    slot_12_00 slot_12_30 slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    (slot slot_9_00) (slot slot_9_30) (slot slot_10_00) (slot slot_10_30)
    (slot slot_11_00) (slot slot_11_30) (slot slot_12_00) (slot slot_12_30)
    (slot slot_13_00) (slot slot_13_30) (slot slot_14_00) (slot slot_14_30)
    (slot slot_15_00) (slot slot_15_30) (slot slot_16_00) (slot slot_16_30)

    ;; Roy's calendar: blocked 9:00,10:00,11:00,12:30 -> free are the other slots
    (free-roy slot_9_30) (free-roy slot_10_30) (free-roy slot_11_30)
    (free-roy slot_12_00) (free-roy slot_13_00) (free-roy slot_13_30)
    (free-roy slot_14_00) (free-roy slot_14_30) (free-roy slot_15_00)
    (free-roy slot_15_30) (free-roy slot_16_00) (free-roy slot_16_30)

    ;; Kathryn's calendar: blocked 9:30 and 16:30 -> free are the other slots
    (free-kathryn slot_9_00) (free-kathryn slot_10_00) (free-kathryn slot_10_30)
    (free-kathryn slot_11_00) (free-kathryn slot_11_30) (free-kathryn slot_12_00)
    (free-kathryn slot_12_30) (free-kathryn slot_13_00) (free-kathryn slot_13_30)
    (free-kathryn slot_14_00) (free-kathryn slot_14_30) (free-kathryn slot_15_00)
    (free-kathryn slot_15_30) (free-kathryn slot_16_00)

    ;; Amy's calendar: blocked 9:00-14:30, 15:00-16:00, 16:30-17:00 -> free at 14:30 and 16:00
    (free-amy slot_14_30) (free-amy slot_16_00)

    ;; Amy preference: would rather not meet after 15:30 -> prefer 14:30
    (preferred-amy slot_14_30)
  )

  (:goal (meeting-scheduled slot_14_30))
)