(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    elijah janet brian carl timothy - participant
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
    meeting1 - meeting
  )

  (:init
    (free elijah slot-0900) (free elijah slot-0930) (free elijah slot-1100) (free elijah slot-1130)
    (free elijah slot-1230) (free elijah slot-1300) (free elijah slot-1330) (free elijah slot-1400)
    (free elijah slot-1430) (free elijah slot-1530) (free elijah slot-1600) (free elijah slot-1630)

    (free janet slot-0900) (free janet slot-1030) (free janet slot-1100) (free janet slot-1130)
    (free janet slot-1200) (free janet slot-1230) (free janet slot-1300) (free janet slot-1530)
    (free janet slot-1600) (free janet slot-1630)

    (free brian slot-0900) (free brian slot-0930) (free brian slot-1000) (free brian slot-1030)
    (free brian slot-1100) (free brian slot-1130) (free brian slot-1200) (free brian slot-1230)
    (free brian slot-1300) (free brian slot-1330) (free brian slot-1400) (free brian slot-1430)
    (free brian slot-1500) (free brian slot-1530) (free brian slot-1600) (free brian slot-1630)

    (free carl slot-0900) (free carl slot-1630)

    (free timothy slot-0900) (free timothy slot-0930) (free timothy slot-1000)
    (free timothy slot-1200) (free timothy slot-1230) (free timothy slot-1300)
    (free timothy slot-1400) (free timothy slot-1600)

    (= (total-cost) 0)

    (cost1 slot-0900)
    (cost2 slot-0930)
    (cost3 slot-1000)
    (cost4 slot-1030)
    (cost5 slot-1100)
    (cost6 slot-1130)
    (cost7 slot-1200)
    (cost8 slot-1230)
    (cost9 slot-1300)
    (cost10 slot-1330)
    (cost11 slot-1400)
    (cost12 slot-1430)
    (cost13 slot-1500)
    (cost14 slot-1530)
    (cost15 slot-1600)
    (cost16 slot-1630)
  )

  (:goal (assigned meeting1))
  (:metric minimize (total-cost))
)