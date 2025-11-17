(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    brandon jerry bradley - person
    s1500_1530 - slot
  )
  (:init
    ; The only provided slot is the selected feasible slot 15:00-15:30,
    ; which satisfies Brandon's hard preference to avoid meetings before 14:30.
    (within-hours s1500_1530)
    (slot-free brandon s1500_1530)
    (slot-free jerry s1500_1530)
    (slot-free bradley s1500_1530)
  )
  (:goal (and
    (scheduled)
    (chosen s1500_1530)
  ))
)