(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)

  (:objects
    diana ethan janet - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (agent diana) (agent ethan) (agent janet)
    (slot s0900) (slot s0930) (slot s1000) (slot s1030) (slot s1100) (slot s1130) (slot s1200) (slot s1230)
    (slot s1300) (slot s1330) (slot s1400) (slot s1430) (slot s1500) (slot s1530) (slot s1600) (slot s1630)

    (available ethan s0900) (available ethan s0930) (available ethan s1000) (available ethan s1030)
    (available ethan s1100) (available ethan s1130) (available ethan s1200) (available ethan s1230)
    (available ethan s1300) (available ethan s1330) (available ethan s1400) (available ethan s1430)
    (available ethan s1500) (available ethan s1530) (available ethan s1600) (available ethan s1630)

    (available diana s0900) (available diana s0930) (available diana s1000) (available diana s1030)
    (available diana s1100) (available diana s1200) (available diana s1230)
    (available diana s1330) (available diana s1400) (available diana s1430)
    (available diana s1500) (available diana s1530) (available diana s1600) (available diana s1630)

    (available janet s1000) (available janet s1030) (available janet s1100)
  )

  (:goal
    (or
      (meeting-scheduled s1000)
      (meeting-scheduled s1030)
      (meeting-scheduled s1100)
    )
  )
)