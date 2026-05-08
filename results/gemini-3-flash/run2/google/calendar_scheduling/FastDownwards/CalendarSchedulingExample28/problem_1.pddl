(define (problem schedule_28)
  (:domain calendar_scheduling)
  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30 s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (current_slot s_09_00)
    
    ;; Time continuity
    (next s_09_00 s_09_30)
    (next s_09_30 s_10_00)
    (next s_10_00 s_10_30)
    (next s_10_30 s_11_00)
    (next s_11_00 s_11_30)
    (next s_11_30 s_12_00)
    (next s_12_00 s_12_30)
    (next s_12_30 s_13_00)
    (next s_13_00 s_13_30)
    (next s_13_30 s_14_00)
    (next s_14_00 s_14_30)
    (next s_14_30 s_15_00)
    (next s_15_00 s_15_30)
    (next s_15_30 s_16_00)
    (next s_16_00 s_16_30)

    ;; Availability tracking based on provided schedules:
    ;; Brittany: 13:00-13:30, 16:00-16:30
    ;; Emily: Always free
    ;; Doris: 9:00-11:00, 11:30-14:30, 15:00-17:00

    ;; 09:00 - 11:00 (Doris busy)
    (slot_unavailable s_09_00)
    (slot_unavailable s_09_30)
    (slot_unavailable s_10_00)
    (slot_unavailable s_10_30)

    ;; 11:00 - 11:30 (Everyone free)
    (slot_available s_11_00)

    ;; 11:30 - 14:30 (Doris busy, Brittany busy 13:00-13:30)
    (slot_unavailable s_11_30)
    (slot_unavailable s_12_00)
    (slot_unavailable s_12_30)
    (slot_unavailable s_13_00)
    (slot_unavailable s_13_30)
    (slot_unavailable s_14_00)

    ;; 14:30 - 15:00 (Everyone free)
    (slot_available s_14_30)

    ;; 15:00 - 17:00 (Doris busy, Brittany busy 16:00-16:30)
    (slot_unavailable s_15_00)
    (slot_unavailable s_15_30)
    (slot_unavailable s_16_00)
    (slot_unavailable s_16_30)
  )

  (:goal (meeting_scheduled))
)