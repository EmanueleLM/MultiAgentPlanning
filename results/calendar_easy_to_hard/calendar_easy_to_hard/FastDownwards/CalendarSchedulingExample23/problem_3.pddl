(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)
  (:objects
    elijah janet brian carl timothy - participant
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
    meeting1 - meeting
  )
  (:init
    (participant elijah) (participant janet) (participant brian) (participant carl) (participant timothy)
    (slot slot-0900) (slot slot-0930) (slot slot-1000) (slot slot-1030) (slot slot-1100) (slot slot-1130)
    (slot slot-1200) (slot slot-1230) (slot slot-1300) (slot slot-1330) (slot slot-1400) (slot slot-1430)
    (slot slot-1500) (slot slot-1530) (slot slot-1600) (slot slot-1630)
    (meeting meeting1)
    (free elijah slot-0900) (free elijah slot-0930)
    (free elijah slot-1100) (free elijah slot-1130)
    (free elijah slot-1230) (free elijah slot-1300) (free elijah slot-1330)
    (free elijah slot-1400) (free elijah slot-1430)
    (free elijah slot-1530) (free elijah slot-1600) (free elijah slot-1630)
    (free janet slot-0900)
    (free janet slot-1030) (free janet slot-1100) (free janet slot-1130)
    (free janet slot-1200) (free janet slot-1230) (free janet slot-1300)
    (free janet slot-1530) (free janet slot-1600) (free janet slot-1630)
    (free carl slot-0900) (free carl slot-1630)
    (free timothy slot-0900) (free timothy slot-0930) (free timothy slot-1000)
    (free timothy slot-1200) (free timothy slot-1230) (free timothy slot-1300)
    (free timothy slot-1400) (free timothy slot-1600)
    (= (total-cost) 0)
  )
  (:metric minimize (total-cost))
  (:goal (assigned meeting1))
)