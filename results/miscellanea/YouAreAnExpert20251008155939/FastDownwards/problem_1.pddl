(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    michelle steven jerry - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)
    (busy michelle s1100)
    (busy michelle s1130)
    (busy steven s0900)
    (busy steven s1130)
    (busy steven s1330)
    (busy steven s1530)
    (busy jerry s0900)
    (busy jerry s1000) (busy jerry s1030)
    (busy jerry s1130) (busy jerry s1200)
    (busy jerry s1300) (busy jerry s1330) (busy jerry s1400)
    (busy jerry s1530)
    (busy jerry s1630)
  )
  (:goal (and (scheduled s1430 s1500)))
)