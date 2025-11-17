(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    t1000_1030 t1530_1600 - timeslot
    ralph peter daniel - participant
  )
  (:init
    (available ralph t1000_1030)
    (available peter t1000_1030)
    (available daniel t1000_1030)

    (available ralph t1530_1600)
    (available peter t1530_1600)
    (available daniel t1530_1600)

    (within_work_hours t1000_1030)
    (within_work_hours t1530_1600)

    (before t1000_1030 t1530_1600)

    (preferred t1000_1030)
  )
  (:goal
    (assignedall)
  )
)