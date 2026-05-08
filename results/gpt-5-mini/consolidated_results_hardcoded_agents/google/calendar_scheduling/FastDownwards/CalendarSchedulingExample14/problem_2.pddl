(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    brandon jerry bradley - person
    s1500_1530 - slot
    t1500 t1530 - time
  )
  (:init
    ;; Slot mapping to explicit start and end times, with successor relation enforcing contiguous 30-min occupancy
    (within-hours s1500_1530)
    (slot-start s1500_1530 t1500)
    (slot-end s1500_1530 t1530)
    (succ t1500 t1530)

    ;; All participants are free at the chosen slot per audited availability
    (slot-free brandon s1500_1530)
    (slot-free jerry s1500_1530)
    (slot-free bradley s1500_1530)
  )
  (:goal (and
    (scheduled)
  ))
)