(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    elijah janet brian carl timothy - participant
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
  )

  (:goal (assigned meeting1))
  (:metric minimize (total-cost))
)