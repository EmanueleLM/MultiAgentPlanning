(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (available_lawrence s0900) (available_lawrence s0930) (available_lawrence s1000) (available_lawrence s1030)
    (available_lawrence s1100) (available_lawrence s1130) (available_lawrence s1200) (available_lawrence s1230)
    (available_lawrence s1300) (available_lawrence s1330) (available_lawrence s1400) (available_lawrence s1430)
    (available_lawrence s1500) (available_lawrence s1530) (available_lawrence s1600) (available_lawrence s1630)

    (available_christine s0930) (available_christine s1000) (available_christine s1030) (available_christine s1100)
    (available_christine s1130) (available_christine s1200) (available_christine s1300) (available_christine s1330)
    (available_christine s1400) (available_christine s1430) (available_christine s1500) (available_christine s1530)
    (available_christine s1600) (available_christine s1630)

    (available_barbara s0900) (available_barbara s0930) (available_barbara s1000) (available_barbara s1130)
    (available_barbara s1230) (available_barbara s1330) (available_barbara s1430) (available_barbara s1500)
    (available_barbara s1600) (available_barbara s1630)

    (available_stephanie s0900) (available_stephanie s0930) (available_stephanie s1100) (available_stephanie s1200)
    (available_stephanie s1330) (available_stephanie s1400) (available_stephanie s1500) (available_stephanie s1600)

    (available_hannah s1000) (available_hannah s1200) (available_hannah s1300) (available_hannah s1330)
    (available_hannah s1530) (available_hannah s1630)
  )
  (:goal (meeting_scheduled))
)