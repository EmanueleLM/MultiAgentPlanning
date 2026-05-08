(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    billy maria william - person
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30 t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 t_17_00 - time_slot
  )
  (:init
    ;; Time order
    (next t_09_00 t_09_30)
    (next t_09_30 t_10_00)
    (next t_10_00 t_10_30)
    (next t_10_30 t_11_00)
    (next t_11_00 t_11_30)
    (next t_11_30 t_12_00)
    (next t_12_00 t_12_30)
    (next t_12_30 t_13_00)
    (next t_13_00 t_13_30)
    (next t_13_30 t_14_00)
    (next t_14_00 t_14_30)
    (next t_14_30 t_15_00)
    (next t_15_00 t_15_30)
    (next t_15_30 t_16_00)
    (next t_16_00 t_16_30)
    (next t_16_30 t_17_00)

    ;; Billy is busy on Monday during 11:30 to 12:00, 13:00 to 15:00, 16:00 to 16:30
    (available billy t_09_00 t_09_30)
    (available billy t_09_30 t_10_00)
    (available billy t_10_00 t_10_30)
    (available billy t_10_30 t_11_00)
    (available billy t_11_00 t_11_30)
    ;; 11:30-12:00 Busy
    (available billy t_12_00 t_12_30)
    (available billy t_12_30 t_13_00)
    ;; 13:00-15:00 Busy
    (available billy t_15_00 t_15_30)
    (available billy t_15_30 t_16_00)
    ;; 16:00-16:30 Busy
    (available billy t_16_30 t_17_00)

    ;; Maria has blocked their calendar on Monday during 9:00 to 9:30, 10:00 to 10:30, 13:00 to 13:30, 14:00 to 14:30
    ;; 9:00-9:30 Busy
    (available maria t_09_30 t_10_00)
    ;; 10:00-10:30 Busy
    (available maria t_10_30 t_11_00)
    (available maria t_11_00 t_11_30)
    (available maria t_11_30 t_12_00)
    (available maria t_12_00 t_12_30)
    (available maria t_12_30 t_13_00)
    ;; 13:00-13:30 Busy
    (available maria t_13_30 t_14_00)
    ;; 14:00-14:30 Busy
    (available maria t_14_30 t_15_00)
    (available maria t_15_00 t_15_30)
    (available maria t_15_30 t_16_00)
    (available maria t_16_00 t_16_30)
    (available maria t_16_30 t_17_00)

    ;; William has meetings on Monday during 9:30 to 10:00, 12:00 to 12:30, 13:30 to 15:00, 15:30 to 17:00
    (available william t_09_00 t_09_30)
    ;; 9:30-10:00 Busy
    (available william t_10_00 t_10_30)
    (available william t_10_30 t_11_00)
    (available william t_11_00 t_11_30)
    (available william t_11_30 t_12_00)
    ;; 12:00-12:30 Busy
    (available william t_12_30 t_13_00)
    (available william t_13_00 t_13_30)
    ;; 13:30-15:00 Busy
    (available william t_15_00 t_15_30)
    ;; 15:30-17:00 Busy
  )
  (:goal
    (meeting_scheduled)
  )
)