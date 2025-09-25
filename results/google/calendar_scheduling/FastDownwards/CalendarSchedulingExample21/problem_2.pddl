(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    (free bobby s0900) (free bobby s0930) (free bobby s1000) (free bobby s1030)
    (free bobby s1100) (free bobby s1130) (free bobby s1200) (free bobby s1230)
    (free bobby s1300) (free bobby s1330) (free bobby s1400) (free bobby s1430)
    (free bobby s1500) (free bobby s1530) (free bobby s1600) (free bobby s1630)

    (free scott s0900) (free scott s0930) (free scott s1000) (free scott s1030)
    (free scott s1100) (free scott s1200) (free scott s1230) (free scott s1300) (free scott s1330)
    (free scott s1400) (free scott s1430) (free scott s1500) (free scott s1600) (free scott s1630)

    (free kimberly s0900) (free kimberly s0930) (free kimberly s1000) (free kimberly s1030)
    (free kimberly s1200) (free kimberly s1300) (free kimberly s1400) (free kimberly s1500)
  )
  (:goal (meeting-scheduled))
)