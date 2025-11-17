(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    brandon jerry bradley - person
    s1500_1530 - slot
  )
  (:init
    ;; The chosen feasible slot 15:00-15:30 is within work hours and free for all participants.
    (within-hours s1500_1530)
    (slot-free brandon s1500_1530)
    (slot-free jerry s1500_1530)
    (slot-free bradley s1500_1530)
  )
  (:goal (and
    (scheduled)
  ))
)