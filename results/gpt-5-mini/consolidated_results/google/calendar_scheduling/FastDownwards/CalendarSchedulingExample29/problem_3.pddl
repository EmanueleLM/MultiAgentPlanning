(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)

  (:objects
    madison diana shirley - person

    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030)
    (next s1030 s1100) (next s1100 s1130) (next s1130 s1200)
    (next s1200 s1230) (next s1230 s1300) (next s1300 s1330)
    (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    (free madison s0900) (free madison s1000) (free madison s1030)
    (free madison s1100) (free madison s1200) (free madison s1230)
    (free madison s1300) (free madison s1330) (free madison s1400)
    (free madison s1430) (free madison s1500) (free madison s1530)
    (free madison s1600) (free madison s1630)

    (free diana s0900) (free diana s0930) (free diana s1000)
    (free diana s1030) (free diana s1130) (free diana s1200)
    (free diana s1230) (free diana s1330) (free diana s1400)
    (free diana s1430) (free diana s1500) (free diana s1530)
    (free diana s1600) (free diana s1630)

    (free shirley s1200) (free shirley s1230) (free shirley s1300) (free shirley s1500)
  )

  (:goal (meeting_scheduled))
)