(define (problem schedule-meeting-monday)
  (:domain meeting-scheduler)
  (:objects
    arthur michael samantha - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (next s0900 s0930)
    (next s0930 s1000)
    (next s1000 s1030)
    (next s1030 s1100)
    (next s1100 s1130)
    (next s1130 s1200)
    (next s1200 s1230)
    (next s1230 s1300)
    (next s1300 s1330)
    (next s1330 s1400)
    (next s1400 s1430)
    (next s1430 s1500)
    (next s1500 s1530)
    (next s1530 s1600)
    (next s1600 s1630)

    (free arthur s0930) (free arthur s1000)
    (free arthur s1200) (free arthur s1230) (free arthur s1300) (free arthur s1330)
    (free arthur s1400) (free arthur s1430) (free arthur s1500) (free arthur s1530)

    (free michael s0900) (free michael s0930) (free michael s1000) (free michael s1030)
    (free michael s1100) (free michael s1130) (free michael s1200) (free michael s1230)
    (free michael s1330) (free michael s1430) (free michael s1500) (free michael s1530)
    (free michael s1600) (free michael s1630)

    (free samantha s0900) (free samantha s0930) (free samantha s1000)
    (free samantha s1100) (free samantha s1130) (free samantha s1500)
  )
  (:goal (and (meeting-scheduled) (scheduled s0930)))
)