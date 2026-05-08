(define (problem calendar-scheduling-problem23)
  (:domain calendar-scheduling)
  (:objects
    interval_09_00 interval_09_30 interval_10_00 interval_10_30
    interval_11_00 interval_11_30 interval_12_00 interval_12_30
    interval_13_00 interval_13_30 interval_14_00 interval_14_30
    interval_15_00 interval_15_30 interval_16_00 interval_16_30 - interval
  )

  (:init
    ;; successor relations for consecutive 30-minute intervals within 09:00-17:00
    (succ interval_09_00 interval_09_30)
    (succ interval_09_30 interval_10_00)
    (succ interval_10_00 interval_10_30)
    (succ interval_10_30 interval_11_00)
    (succ interval_11_00 interval_11_30)
    (succ interval_11_30 interval_12_00)
    (succ interval_12_00 interval_12_30)
    (succ interval_12_30 interval_13_00)
    (succ interval_13_00 interval_13_30)
    (succ interval_13_30 interval_14_00)
    (succ interval_14_00 interval_14_30)
    (succ interval_14_30 interval_15_00)
    (succ interval_15_00 interval_15_30)
    (succ interval_15_30 interval_16_00)
    (succ interval_16_00 interval_16_30)

    ;; Billy's availability (half-hour intervals not overlapping busy blocks)
    ;; Billy busy: 11:30-12:00, 13:00-15:00, 16:00-16:30
    (available-billy interval_09_00)
    (available-billy interval_09_30)
    (available-billy interval_10_00)
    (available-billy interval_10_30)
    (available-billy interval_11_00)
    (available-billy interval_12_00)
    (available-billy interval_12_30)
    (available-billy interval_15_00)
    (available-billy interval_15_30)
    (available-billy interval_16_30)

    ;; Maria's availability
    ;; Maria busy: 09:00-09:30, 10:00-10:30, 13:00-13:30, 14:00-14:30
    (available-maria interval_09_30)
    (available-maria interval_10_30)
    (available-maria interval_11_00)
    (available-maria interval_11_30)
    (available-maria interval_12_00)
    (available-maria interval_12_30)
    (available-maria interval_13_30)
    (available-maria interval_14_30)
    (available-maria interval_15_00)
    (available-maria interval_15_30)
    (available-maria interval_16_00)
    (available-maria interval_16_30)

    ;; William's availability
    ;; William busy: 09:30-10:00, 12:00-12:30, 13:30-15:00, 15:30-17:00
    (available-william interval_09_00)
    (available-william interval_10_00)
    (available-william interval_10_30)
    (available-william interval_11_00)
    (available-william interval_11_30)
    (available-william interval_12_30)
    (available-william interval_13_00)
    (available-william interval_15_00)
  )

  ;; Goal: exactly one 60-minute meeting is scheduled (meeting-scheduled becomes true).
  (:goal (meeting-scheduled))
)