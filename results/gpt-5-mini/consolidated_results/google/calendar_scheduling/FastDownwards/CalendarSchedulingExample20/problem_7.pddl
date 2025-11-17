(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    t1000_1030 t1530_1600 - timeslot
    ralph peter daniel - participant
  )
  (:init
    ;; common free slots validated by auditor
    (available ralph t1000_1030)
    (available peter t1000_1030)
    (available daniel t1000_1030)

    (available ralph t1530_1600)
    (available peter t1530_1600)
    (available daniel t1530_1600)

    ;; both slots are within declared work hours
    (within_work_hours t1000_1030)
    (within_work_hours t1530_1600)

    ;; explicit ordering among the discrete timeslots
    (successor t1000_1030 t1530_1600)

    ;; auditor-preferred slot
    (preferred t1000_1030)
  )
  (:goal (and
    (assignedall)
  ))
)