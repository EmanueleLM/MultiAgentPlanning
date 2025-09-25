(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    adam jerry matthew - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    monday - day
    dur30 - duration
  )
  (:init
    (day monday)
    (meeting-duration dur30)

    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430) (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    (agent adam) (agent jerry) (agent matthew)

    (available adam s0900) (available adam s0930) (available adam s1030) (available adam s1100)
    (available adam s1130) (available adam s1200) (available adam s1300) (available adam s1430)
    (available adam s1500) (available adam s1530) (available adam s1600) (available adam s1630)

    (available jerry s0930) (available jerry s1000) (available jerry s1030) (available jerry s1100)
    (available jerry s1130) (available jerry s1230) (available jerry s1300) (available jerry s1330)
    (available jerry s1400) (available jerry s1430) (available jerry s1600) (available jerry s1630)

    (available matthew s0900) (available matthew s1100) (available matthew s1230) (available matthew s1400)
  )
  (:goal (meeting-scheduled s1100))
)