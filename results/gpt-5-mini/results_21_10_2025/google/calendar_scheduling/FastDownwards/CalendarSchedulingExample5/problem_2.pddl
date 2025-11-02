(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    kathryn charlotte lauren - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (free kathryn s0930) (free kathryn s1000) (free kathryn s1100)
    (free kathryn s1200) (free kathryn s1230) (free kathryn s1300)
    (free kathryn s1430) (free kathryn s1500) (free kathryn s1530) (free kathryn s1600)

    (free charlotte s0900) (free charlotte s0930) (free charlotte s1000)
    (free charlotte s1030) (free charlotte s1100) (free charlotte s1130)
    (free charlotte s1230) (free charlotte s1300)

    (free lauren s1000) (free lauren s1030) (free lauren s1100)
    (free lauren s1130) (free lauren s1230) (free lauren s1300)
    (free lauren s1430) (free lauren s1600)
  )

  (:goal (meeting-scheduled))
)