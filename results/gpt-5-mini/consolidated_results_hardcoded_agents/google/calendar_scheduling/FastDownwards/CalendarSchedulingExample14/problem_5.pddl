(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    brandon jerry bradley - person
    s1500_1530 - slot
    t1500 t1530 - time
  )
  (:init
    (within-hours s1500_1530)
    (slot-start s1500_1530 t1500)
    (slot-end s1500_1530 t1530)
    (succ t1500 t1530)

    (slot-free brandon s1500_1530)
    (slot-free jerry s1500_1530)
    (slot-free bradley s1500_1530)
  )
  (:goal (and
    (scheduled)
    (chosen s1500_1530)
  ))
)