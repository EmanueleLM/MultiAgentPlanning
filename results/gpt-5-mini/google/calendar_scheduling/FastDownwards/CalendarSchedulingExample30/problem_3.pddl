(define (problem schedule_meeting_monday)
  (:domain calendar_scheduling)
  (:objects
    jeffrey virginia melissa - participant
    slot_9_00 slot_9_30 slot_10_00 slot_10_30
    slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30
    slot_15_00 slot_15_30 slot_16_00 slot_16_30 - slot
  )

  (:init
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

    (busy jeffrey slot_9_30)
    (busy jeffrey slot_10_30)

    (busy virginia slot_9_00)
    (busy virginia slot_10_00)
    (busy virginia slot_14_30)
    (busy virginia slot_16_00)

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

  (:goal (and
    (meeting_scheduled)
    (meeting_before_14)
  ))
)