(define (problem monday-meeting-instance)
  (:domain monday-meeting-scheduling)
  (:objects
    adam jerry matthew - participant
    s09_00_09_30 s09_30_10_00 s10_00_10_30 s10_30_11_00
    s11_00_11_30 s11_30_12_00 s12_00_12_30 s12_30_13_00
    s13_00_13_30 s13_30_14_00 s14_00_14_30 s14_30_15_00
    s15_00_15_30 s15_30_16_00 s16_00_16_30 s16_30_17_00 - slot
    m1 - meeting
  )
  (:init
    ; Work-hour slots (Monday 09:00-17:00)
    (slot-exists s09_00_09_30)
    (slot-exists s09_30_10_00)
    (slot-exists s10_00_10_30)
    (slot-exists s10_30_11_00)
    (slot-exists s11_00_11_30)
    (slot-exists s11_30_12_00)
    (slot-exists s12_00_12_30)
    (slot-exists s12_30_13_00)
    (slot-exists s13_00_13_30)
    (slot-exists s13_30_14_00)
    (slot-exists s14_00_14_30)
    (slot-exists s14_30_15_00)
    (slot-exists s15_00_15_30)
    (slot-exists s15_30_16_00)
    (slot-exists s16_00_16_30)
    (slot-exists s16_30_17_00)

    ; Availabilities derived from calendars
    ; Adam busy: 10:00-10:30, 12:30-13:00, 13:30-14:30
    (available adam s09_00_09_30)
    (available adam s09_30_10_00)
    (available adam s10_30_11_00)
    (available adam s11_00_11_30)
    (available adam s11_30_12_00)
    (available adam s12_00_12_30)
    (available adam s13_00_13_30)
    (available adam s14_30_15_00)
    (available adam s15_00_15_30)
    (available adam s15_30_16_00)
    (available adam s16_00_16_30)
    (available adam s16_30_17_00)

    ; Jerry busy: 09:00-09:30, 12:00-12:30, 15:00-16:00
    (available jerry s09_30_10_00)
    (available jerry s10_00_10_30)
    (available jerry s10_30_11_00)
    (available jerry s11_00_11_30)
    (available jerry s11_30_12_00)
    (available jerry s12_30_13_00)
    (available jerry s13_00_13_30)
    (available jerry s13_30_14_00)
    (available jerry s14_00_14_30)
    (available jerry s14_30_15_00)
    (available jerry s16_00_16_30)
    (available jerry s16_30_17_00)

    ; Matthew busy: 09:30-11:00, 11:30-12:30, 13:00-14:00, 14:30-17:00
    (available matthew s09_00_09_30)
    (available matthew s11_00_11_30)
    (available matthew s12_30_13_00)
    (available matthew s14_00_14_30)

    ; Only common slot where all three are available
    (all-available s11_00_11_30)
  )
  (:goal (and
    (scheduled m1)
  ))
)