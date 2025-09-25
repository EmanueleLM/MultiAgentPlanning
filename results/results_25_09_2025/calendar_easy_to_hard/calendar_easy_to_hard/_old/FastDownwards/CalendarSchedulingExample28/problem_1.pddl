(define (problem schedule-meeting-integrated)
  (:domain merged-meeting-scheduling)

  (:objects
    brittany emily doris - person
    meet1 - meeting
    slot-0900 slot-0930 slot-1000 slot-1030
    slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430
    slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )

  (:init
    ;; work hours (09:00-17:00; 30-minute granularity; last start 16:30)
    (work-slot slot-0900) (work-slot slot-0930) (work-slot slot-1000) (work-slot slot-1030)
    (work-slot slot-1100) (work-slot slot-1130) (work-slot slot-1200) (work-slot slot-1230)
    (work-slot slot-1300) (work-slot slot-1330) (work-slot slot-1400) (work-slot slot-1430)
    (work-slot slot-1500) (work-slot slot-1530) (work-slot slot-1600) (work-slot slot-1630)

    ;; Emily available/free all slots
    (available emily slot-0900) (free emily slot-0900)
    (available emily slot-0930) (free emily slot-0930)
    (available emily slot-1000) (free emily slot-1000)
    (available emily slot-1030) (free emily slot-1030)
    (available emily slot-1100) (free emily slot-1100)
    (available emily slot-1130) (free emily slot-1130)
    (available emily slot-1200) (free emily slot-1200)
    (available emily slot-1230) (free emily slot-1230)
    (available emily slot-1300) (free emily slot-1300)
    (available emily slot-1330) (free emily slot-1330)
    (available emily slot-1400) (free emily slot-1400)
    (available emily slot-1430) (free emily slot-1430)
    (available emily slot-1500) (free emily slot-1500)
    (available emily slot-1530) (free emily slot-1530)
    (available emily slot-1600) (free emily slot-1600)
    (available emily slot-1630) (free emily slot-1630)

    ;; Brittany: available at all work slots except 13:00 (slot-1300) and 16:00 (slot-1600)
    (available brittany slot-0900) (free brittany slot-0900)
    (available brittany slot-0930) (free brittany slot-0930)
    (available brittany slot-1000) (free brittany slot-1000)
    (available brittany slot-1030) (free brittany slot-1030)
    (available brittany slot-1100) (free brittany slot-1100)
    (available brittany slot-1130) (free brittany slot-1130)
    (available brittany slot-1200) (free brittany slot-1200)
    (available brittany slot-1230) (free brittany slot-1230)
    (available brittany slot-1330) (free brittany slot-1330)
    (available brittany slot-1400) (free brittany slot-1400)
    (available brittany slot-1430) (free brittany slot-1430)
    (available brittany slot-1500) (free brittany slot-1500)
    (available brittany slot-1530) (free brittany slot-1530)
    (available brittany slot-1630) (free brittany slot-1630)

    ;; Doris: available only at 11:00 and 14:30
    (available doris slot-1100) (free doris slot-1100)
    (available doris slot-1430) (free doris slot-1430)
  )

  (:goal (and (scheduled-at meet1 slot-1100)))
)