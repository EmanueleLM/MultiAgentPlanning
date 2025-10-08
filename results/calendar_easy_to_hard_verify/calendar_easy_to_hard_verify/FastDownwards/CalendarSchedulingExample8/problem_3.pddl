(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - timeslot
  )
  (:init
    (free adam s0900) (free adam s0930) (free adam s1030) (free adam s1100)
    (free adam s1130) (free adam s1200) (free adam s1300) (free adam s1430)
    (free adam s1500) (free adam s1530) (free adam s1600) (free adam s1630)
    (free jerry s0930) (free jerry s1000) (free jerry s1030) (free jerry s1100)
    (free jerry s1130) (free jerry s1230) (free jerry s1300) (free jerry s1330)
    (free jerry s1400) (free jerry s1430) (free jerry s1600) (free jerry s1630)
    (free matthew s0900) (free matthew s1100) (free matthew s1230) (free matthew s1400)
  )
  (:goal (meeting-scheduled))
)