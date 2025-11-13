(define (problem meeting-scheduling-instance)
  (:domain meeting-scheduling)
  (:objects
    t1230_1300_mon - timeslot
  )
  (:init
    (within_work_hours t1230_1300_mon)
    (available scott t1230_1300_mon)
    (available gabriel t1230_1300_mon)
    (available christine t1230_1300_mon)
  )
  (:goal
    (and
      (scheduled)
    )
  )
)