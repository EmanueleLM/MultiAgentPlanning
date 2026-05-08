(define (problem schedule_meeting_monday)
  (:domain jack_of_all_trades_meeting)
  (:objects
    catherine michael alexander - person
    slot_9_00_9_30 slot_9_30_10_00 slot_10_00_10_30 slot_10_30_11_00
    slot_11_00_11_30 slot_11_30_12_00 slot_12_00_12_30 slot_12_30_13_00
    slot_13_00_13_30 slot_13_30_14_00 slot_14_00_14_30 slot_14_30_15_00
    slot_15_00_15_30 slot_15_30_16_00 slot_16_00_16_30 slot_16_30_17_00 - timeslot
  )
  (:init
    ;; work slots covering 9:00-17:00 in 30-minute granularity
    (work_slot slot_9_00_9_30)
    (work_slot slot_9_30_10_00)
    (work_slot slot_10_00_10_30)
    (work_slot slot_10_30_11_00)
    (work_slot slot_11_00_11_30)
    (work_slot slot_11_30_12_00)
    (work_slot slot_12_00_12_30)
    (work_slot slot_12_30_13_00)
    (work_slot slot_13_00_13_30)
    (work_slot slot_13_30_14_00)
    (work_slot slot_14_00_14_30)
    (work_slot slot_14_30_15_00)
    (work_slot slot_15_00_15_30)
    (work_slot slot_15_30_16_00)
    (work_slot slot_16_00_16_30)
    (work_slot slot_16_30_17_00)

    ;; Catherine busy slots (10:30-11:00, 12:30-13:30, 14:30-15:00)
    (busy catherine slot_10_30_11_00)
    (busy catherine slot_12_30_13_00)
    (busy catherine slot_13_00_13_30)
    (busy catherine slot_14_30_15_00)

    ;; Michael busy slots (9:30-10:30, 12:00-13:00, 13:30-14:00, 15:00-15:30)
    (busy michael slot_9_30_10_00)
    (busy michael slot_10_00_10_30)
    (busy michael slot_12_00_12_30)
    (busy michael slot_12_30_13_00)
    (busy michael slot_13_30_14_00)
    (busy michael slot_15_00_15_30)

    ;; Alexander busy slots (9:00-9:30, 10:00-10:30, 11:00-12:00, 13:00-13:30, 14:00-16:00, 16:30-17:00)
    (busy alexander slot_9_00_9_30)
    (busy alexander slot_10_00_10_30)
    (busy alexander slot_11_00_11_30)
    (busy alexander slot_11_30_12_00)
    (busy alexander slot_13_00_13_30)
    (busy alexander slot_14_00_14_30)
    (busy alexander slot_14_30_15_00)
    (busy alexander slot_15_00_15_30)
    (busy alexander slot_15_30_16_00)
    (busy alexander slot_16_30_17_00)
  )
  (:goal (and (meeting_scheduled)))
)