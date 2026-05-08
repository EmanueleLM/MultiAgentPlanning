(define (problem schedule_meeting_problem)
  (:domain jack_of_all_trades)
  (:objects
    emily melissa frank - participant
    meeting1 - meeting
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30 slot_15_00 slot_15_30 slot_16_00 slot_16_30 - timeslot
  )
  (:init
    ;; workhours (09:00-17:00 half-hour slots)
    (in_workhours slot_9_00) (in_workhours slot_9_30) (in_workhours slot_10_00) (in_workhours slot_10_30)
    (in_workhours slot_11_00) (in_workhours slot_11_30) (in_workhours slot_12_00) (in_workhours slot_12_30)
    (in_workhours slot_13_00) (in_workhours slot_13_30) (in_workhours slot_14_00) (in_workhours slot_14_30)
    (in_workhours slot_15_00) (in_workhours slot_15_30) (in_workhours slot_16_00) (in_workhours slot_16_30)

    ;; busy facts (from participants' calendars)
    ;; Emily busy: 10:00-10:30, 11:30-12:30, 14:00-15:00, 16:00-16:30
    (busy emily slot_10_00)
    (busy emily slot_11_30)
    (busy emily slot_12_00)
    (busy emily slot_14_00)
    (busy emily slot_14_30)
    (busy emily slot_16_00)

    ;; Melissa busy: 9:30-10:00, 14:30-15:00
    (busy melissa slot_9_30)
    (busy melissa slot_14_30)

    ;; Frank busy: 10:00-10:30, 11:00-11:30, 12:30-13:00, 13:30-14:30, 15:00-16:00, 16:30-17:00
    (busy frank slot_10_00)
    (busy frank slot_11_00)
    (busy frank slot_12_30)
    (busy frank slot_13_30)
    (busy frank slot_14_00)
    (busy frank slot_15_00)
    (busy frank slot_15_30)
    (busy frank slot_16_30)

    ;; available facts (workhours minus busy; Frank's hard preference removes any slot starting after 09:30)
    ;; Emily available
    (available emily slot_9_00) (available emily slot_9_30) (available emily slot_10_30)
    (available emily slot_11_00) (available emily slot_12_30) (available emily slot_13_00)
    (available emily slot_13_30) (available emily slot_15_00) (available emily slot_15_30)
    (available emily slot_16_30)

    ;; Melissa available
    (available melissa slot_9_00) (available melissa slot_10_00) (available melissa slot_10_30)
    (available melissa slot_11_00) (available melissa slot_11_30) (available melissa slot_12_00)
    (available melissa slot_12_30) (available melissa slot_13_00) (available melissa slot_13_30)
    (available melissa slot_14_00) (available melissa slot_15_00) (available melissa slot_15_30)
    (available melissa slot_16_00) (available melissa slot_16_30)

    ;; Frank available (hard constraint: no meetings starting after 09:30)
    (available frank slot_9_00) (available frank slot_9_30)
  )

  (:goal (and
    (scheduled meeting1)
  ))
)