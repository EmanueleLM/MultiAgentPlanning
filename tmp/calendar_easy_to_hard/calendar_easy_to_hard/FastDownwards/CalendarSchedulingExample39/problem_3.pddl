(define (problem schedule-meeting-monday-integrated)
  (:domain meeting-scheduling-integrated)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    meeting1 - meeting
  )
  (:init
    (free nicholas s0900) (free nicholas s0930) (free nicholas s1000) (free nicholas s1030)
    (free nicholas s1100) (free nicholas s1130) (free nicholas s1200) (free nicholas s1230)
    (free nicholas s1300) (free nicholas s1330) (free nicholas s1400) (free nicholas s1430)
    (free nicholas s1500) (free nicholas s1530) (free nicholas s1600) (free nicholas s1630)

    (free emma s0900) (free emma s0930) (free emma s1000) (free emma s1030)
    (free emma s1100) (free emma s1130) (free emma s1200) (free emma s1230)
    (free emma s1300) (free emma s1330) (free emma s1400) (free emma s1430)
    (free emma s1500) (free emma s1530) (free emma s1600) (free emma s1630)

    (free catherine s0930) (free catherine s1000) (free catherine s1030) (free catherine s1100)
    (free catherine s1200) (free catherine s1230) (free catherine s1300) (free catherine s1400)
    (free catherine s1430) (free catherine s1500) (free catherine s1600) (free catherine s1630)

    (free steven s0930) (free steven s1630)

    (free adam s1000) (free adam s1300) (free adam s1400) (free adam s1630)

    (free lori s1130) (free lori s1200) (free lori s1330) (free lori s1400)
    (free lori s1430) (free lori s1500) (free lori s1530) (free lori s1630)
  )
  (:goal (and (scheduled meeting1 s1630)))
)