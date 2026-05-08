(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    brandon jerry bradley - person
    s1500_1530 - slot
    t1500 t1530 - time
  )
  (:init
    ;; Slot 15:00-15:30 is within work hours and represents a contiguous 30-minute slot
    (within-hours s1500_1530)
    (slot-start s1500_1530 t1500)
    (slot-end s1500_1530 t1530)
    (succ t1500 t1530)

    ;; All participants are free for this slot (based on audited availabilities)
    (slot-free brandon s1500_1530)
    (slot-free jerry s1500_1530)
    (slot-free bradley s1500_1530)
  )
  (:goal (and
    (scheduled)
  ))
)