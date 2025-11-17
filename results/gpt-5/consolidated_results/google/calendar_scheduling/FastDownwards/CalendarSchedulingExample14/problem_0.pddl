(define (problem schedule_monday_1500_1530)
  (:domain calendar_scheduling)
  (:objects
    s1500_1530 - slot
  )
  (:init
    (within-hours s1500_1530)
    (slot-free brandon s1500_1530)
    (slot-free jerry s1500_1530)
    (slot-free bradley s1500_1530)
  )
  (:goal
    (and
      (scheduled)
      (chosen s1500_1530)
    )
  )
)