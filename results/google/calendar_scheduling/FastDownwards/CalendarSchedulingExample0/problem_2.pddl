(define (problem schedule-meeting-monday)
  (:domain multi-agent-meeting)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 - slot
  )

  (:init
    (available michelle s0900)
    (available michelle s0930)
    (available michelle s1000)
    (available michelle s1200)
    (available michelle s1230)
    (available michelle s1300)
    (available michelle s1330)
    (available michelle s1400)
    (available michelle s1430)
    (available michelle s1500)
    (available michelle s1530)
    (available michelle s1600)

    (available steven s0930)
    (available steven s1000)
    (available steven s1030)
    (available steven s1200)
    (available steven s1230)
    (available steven s1400)
    (available steven s1430)
    (available steven s1600)

    (available jerry s1430)
  )

  (:goal (meeting s1430))
)