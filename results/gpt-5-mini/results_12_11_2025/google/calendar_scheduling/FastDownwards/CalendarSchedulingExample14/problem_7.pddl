(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    brandon jerry bradley - person
    s1500_1530 - slot
    t1500 t1530 - time
  )
  (:init
    ; slot is within work hours
    (within-hours s1500_1530)

    ; explicit start/end times and successor relation (30-minute granularity)
    (slot-start s1500_1530 t1500)
    (slot-end s1500_1530 t1530)
    (succ t1500 t1530)

    ; all three participants are free at this slot (consistent with given calendars)
    (slot-free brandon s1500_1530)
    (slot-free jerry s1500_1530)
    (slot-free bradley s1500_1530)
  )
  (:goal (and
    (scheduled)
    (chosen s1500_1530)
  ))
)