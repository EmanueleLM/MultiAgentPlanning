(define (problem calendar-scheduling-example6)
  (:domain calendar-scheduling)
  (:objects
    slot_09_00_10_00 slot_10_00_11_00 slot_11_00_12_00 slot_12_00_13_00
    slot_13_00_14_00 slot_14_00_15_00 slot_15_00_16_00 slot_16_00_17_00 - time_slot
  )
  (:init
    ; Thomas's calendar is wide open the entire day.
    (available thomas slot_09_00_10_00)
    (available thomas slot_10_00_11_00)
    (available thomas slot_11_00_12_00)
    (available thomas slot_12_00_13_00)
    (available thomas slot_13_00_14_00)
    (available thomas slot_14_00_15_00)
    (available thomas slot_15_00_16_00)
    (available thomas slot_16_00_17_00)

    ; Dylan has blocked their calendar on Monday during 10:30 to 11:00, 13:30 to 14:00.
    ; This means Dylan is not available for slot_10_00_11_00 (overlaps with 10:30-11:00)
    ; and slot_13_00_14_00 (overlaps with 13:30-14:00).
    (available dylan slot_09_00_10_00)
    (available dylan slot_11_00_12_00)
    (available dylan slot_12_00_13_00)
    (available dylan slot_14_00_15_00)
    (available dylan slot_15_00_16_00)
    (available dylan slot_16_00_17_00)

    ; Jerry is busy on Monday during 9:00 to 11:00, 11:30 to 14:30, 16:00 to 17:00.
    ; 9:00-11:00 blocks slot_09_00_10_00, slot_10_00_11_00.
    ; 11:30-14:30 blocks slot_11_00_12_00 (11:30-12:00), slot_12_00_13_00, slot_13_00_14_00, slot_14_00_15_00 (14:00-14:30).
    ; 16:00-17:00 blocks slot_16_00_17_00.
    ; Thus, Jerry is only available for slot_15_00_16_00.
    (available jerry slot_15_00_16_00)
  )
  (:goal (exists (?s - time_slot) (meeting_scheduled ?s)))
)