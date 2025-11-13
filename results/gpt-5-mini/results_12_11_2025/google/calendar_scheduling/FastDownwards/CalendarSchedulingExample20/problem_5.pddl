(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    t1000_1030 t1530_1600 - timeslot
    ralph peter daniel - participant
  )
  (:init
    ;; availability for the common free slots
    (available ralph t1000_1030)
    (available peter t1000_1030)
    (available daniel t1000_1030)

    (available ralph t1530_1600)
    (available peter t1530_1600)
    (available daniel t1530_1600)

    ;; both slots lie within the declared work window
    (within_work_hours t1000_1030)
    (within_work_hours t1530_1600)

    ;; explicit ordering between the discrete timeslots (stage progression)
    (successor t1000_1030 t1530_1600)

    ;; auditor-preferred slot (soft preference encoded in initial state)
    (preferred t1000_1030)
  )
  (:goal (and
    (selected)
    (assigned_any ralph)
    (assigned_any peter)
    (assigned_any daniel)
  ))
)