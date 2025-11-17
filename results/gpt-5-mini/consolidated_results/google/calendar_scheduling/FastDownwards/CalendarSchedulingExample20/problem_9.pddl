(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    t1000_1030 t1530_1600 - timeslot
    ralph peter daniel - participant
  )
  (:init
    ;; availability for the common free slots discovered by the auditor
    (available ralph t1000_1030)
    (available peter t1000_1030)
    (available daniel t1000_1030)

    (available ralph t1530_1600)
    (available peter t1530_1600)
    (available daniel t1530_1600)

    ;; both slots are within the declared work hours (09:00-17:00)
    (within_work_hours t1000_1030)
    (within_work_hours t1530_1600)

    ;; explicit ordering between timeslots (used by planner if needed)
    (before t1000_1030 t1530_1600)

    ;; mark the preferred slot (respecting Daniel's soft preference)
    (preferred t1000_1030)
  )
  (:goal (and
    (assignedall)
  ))
)