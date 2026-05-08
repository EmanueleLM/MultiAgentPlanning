(define (problem schedule_meeting_monday)
  (:domain calendar_scheduling_instance)

  (:objects
    slot_9_00 slot_9_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
    ;; work hours 9:00 - 17:00 (represented as 30-min start slots)
    (work_slot slot_9_00)  (before_14 slot_9_00)
    (work_slot slot_9_30)  (before_14 slot_9_30)
    (work_slot slot_10_00) (before_14 slot_10_00)
    (work_slot slot_10_30) (before_14 slot_10_30)
    (work_slot slot_11_00) (before_14 slot_11_00)
    (work_slot slot_11_30) (before_14 slot_11_30)
    (work_slot slot_12_00) (before_14 slot_12_00)
    (work_slot slot_12_30) (before_14 slot_12_30)
    (work_slot slot_13_00) (before_14 slot_13_00)
    (work_slot slot_13_30) (before_14 slot_13_30)
    (work_slot slot_14_00)
    (work_slot slot_14_30)
    (work_slot slot_15_00)
    (work_slot slot_15_30)
    (work_slot slot_16_00)
    (work_slot slot_16_30)

    ;; existing booked slots (participant busy facts)
    ;; Jeffrey: 9:30-10:00, 10:30-11:00 -> slots 9:30, 10:30
    (busy jeffrey slot_9_30)
    (busy jeffrey slot_10_30)

    ;; Virginia: 9:00-9:30, 10:00-10:30, 14:30-15:00, 16:00-16:30
    (busy virginia slot_9_00)
    (busy virginia slot_10_00)
    (busy virginia slot_14_30)
    (busy virginia slot_16_00)

    ;; Melissa: 9:00-11:30, 12:00-12:30, 13:00-15:00, 16:00-17:00
    ;; occupying slots: 9:00,9:30,10:00,10:30,11:00, 12:00, 13:00,13:30,14:00,14:30, 16:00,16:30
    (busy melissa slot_9_00)
    (busy melissa slot_9_30)
    (busy melissa slot_10_00)
    (busy melissa slot_10_30)
    (busy melissa slot_11_00)
    (busy melissa slot_12_00)
    (busy melissa slot_13_00)
    (busy melissa slot_13_30)
    (busy melissa slot_14_00)
    (busy melissa slot_14_30)
    (busy melissa slot_16_00)
    (busy melissa slot_16_30)
  )

  ;; Goal: schedule the meeting and respect Melissa's preference to meet before 14:00.
  (:goal (and
    (meeting_scheduled)
    (meeting_before_14)
  ))
)