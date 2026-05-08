(define (problem schedule_meeting_problem)
  (:domain jack_of_all_trades)
  (:objects
    emily melissa frank - participant
    meeting1 - meeting
    slot_9_00 slot_9_30 slot_10_00 slot_10_30 slot_11_00 slot_11_30 slot_12_00 slot_12_30
    slot_13_00 slot_13_30 slot_14_00 slot_14_30 slot_15_00 slot_15_30 slot_16_00 slot_16_30 - timeslot
  )

  (:init
    ;; workhours: 9:00 - 17:00 represented as half-hour slots
    (in_workhours slot_9_00) (in_workhours slot_9_30) (in_workhours slot_10_00) (in_workhours slot_10_30)
    (in_workhours slot_11_00) (in_workhours slot_11_30) (in_workhours slot_12_00) (in_workhours slot_12_30)
    (in_workhours slot_13_00) (in_workhours slot_13_30) (in_workhours slot_14_00) (in_workhours slot_14_30)
    (in_workhours slot_15_00) (in_workhours slot_15_30) (in_workhours slot_16_00) (in_workhours slot_16_30)

    ;; Busy facts (participants' existing calendar blocks)
    ;; Emily: 10:00-10:30, 11:30-12:30, 14:00-15:00, 16:00-16:30
    (busy emily slot_10_00)
    (busy emily slot_11_30) (busy emily slot_12_00)
    (busy emily slot_14_00) (busy emily slot_14_30)
    (busy emily slot_16_00)

    ;; Melissa: 9:30-10:00, 14:30-15:00
    (busy melissa slot_9_30)
    (busy melissa slot_14_30)

    ;; Frank: explicit calendar blocks plus a hard preference of "do not want to meet after 9:30".
    ;; To encode that hard preference structurally, mark all slots starting after 9:30 as busy.
    (busy frank slot_10_00) (busy frank slot_10_30)
    (busy frank slot_11_00) (busy frank slot_11_30)
    (busy frank slot_12_00) (busy frank slot_12_30)
    (busy frank slot_13_00) (busy frank slot_13_30)
    (busy frank slot_14_00) (busy frank slot_14_30)
    (busy frank slot_15_00) (busy frank slot_15_30)
    (busy frank slot_16_00) (busy frank slot_16_30)
  )

  ;; Goal: meeting1 must be scheduled (the schedule action will also record the slot and attendees)
  (:goal (scheduled meeting1))
)