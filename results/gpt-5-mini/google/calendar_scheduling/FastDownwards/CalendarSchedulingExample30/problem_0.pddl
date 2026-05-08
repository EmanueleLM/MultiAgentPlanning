(define (problem schedule_meeting_monday)
  (:domain jackofalltrades)
  (:objects
    jeffrey virginia melissa - participant
    slot_9_00 slot_9_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; participants
    (participant jeffrey)
    (participant virginia)
    (participant melissa)

    ;; slots and work_slot flags
    (slot slot_9_00)  (work_slot slot_9_00)  (before_14 slot_9_00)
    (slot slot_9_30)  (work_slot slot_9_30)  (before_14 slot_9_30)
    (slot slot_10_00) (work_slot slot_10_00) (before_14 slot_10_00)
    (slot slot_10_30) (work_slot slot_10_30) (before_14 slot_10_30)
    (slot slot_11_00) (work_slot slot_11_00) (before_14 slot_11_00)
    (slot slot_11_30) (work_slot slot_11_30) (before_14 slot_11_30)
    (slot slot_12_00) (work_slot slot_12_00) (before_14 slot_12_00)
    (slot slot_12_30) (work_slot slot_12_30) (before_14 slot_12_30)
    (slot slot_13_00) (work_slot slot_13_00) (before_14 slot_13_00)
    (slot slot_13_30) (work_slot slot_13_30) (before_14 slot_13_30)
    (slot slot_14_00) (work_slot slot_14_00)
    (slot slot_14_30) (work_slot slot_14_30)
    (slot slot_15_00) (work_slot slot_15_00)
    (slot slot_15_30) (work_slot slot_15_30)
    (slot slot_16_00) (work_slot slot_16_00)
    (slot slot_16_30) (work_slot slot_16_30)

    ;; busy facts from calendars (30-min slots)
    ;; Jeffrey busy: 9:30-10:00, 10:30-11:00
    (busy jeffrey slot_9_30)
    (busy jeffrey slot_10_30)

    ;; Virginia busy: 9:00-9:30, 10:00-10:30, 14:30-15:00, 16:00-16:30
    (busy virginia slot_9_00)
    (busy virginia slot_10_00)
    (busy virginia slot_14_30)
    (busy virginia slot_16_00)

    ;; Melissa busy:
    ;; 9:00-11:30 -> slots 9:00,9:30,10:00,10:30,11:00
    (busy melissa slot_9_00)
    (busy melissa slot_9_30)
    (busy melissa slot_10_00)
    (busy melissa slot_10_30)
    (busy melissa slot_11_00)
    ;; 12:00-12:30
    (busy melissa slot_12_00)
    ;; 13:00-15:00 -> 13:00,13:30,14:00,14:30
    (busy melissa slot_13_00)
    (busy melissa slot_13_30)
    (busy melissa slot_14_00)
    (busy melissa slot_14_30)
    ;; 16:00-17:00 -> 16:00,16:30
    (busy melissa slot_16_00)
    (busy melissa slot_16_30)
  )

  ;; Hard goal: meeting must be scheduled and must respect Melissa's preference
  ;; (meeting_before_14 is treated as a hard constraint per instructions).
  (:goal (and
    (meeting_scheduled)
    (meeting_before_14)
  ))
)