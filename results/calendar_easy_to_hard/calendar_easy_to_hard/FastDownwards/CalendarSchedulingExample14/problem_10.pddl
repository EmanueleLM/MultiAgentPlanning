(define (problem schedule-meeting-monday)
  (:domain multiagent-meeting)

  (:objects
    brandon jerry bradley - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    (available brandon s0900)
    (available brandon s0930)
    (available brandon s1000)
    (available brandon s1030)
    (available brandon s1100)
    (available brandon s1130)
    (available brandon s1200)
    (available brandon s1230)
    (available brandon s1400)
    (available brandon s1430)
    (available brandon s1500)
    (available brandon s1600)

    (available jerry s0900) (available jerry s0930) (available jerry s1000) (available jerry s1030)
    (available jerry s1100) (available jerry s1130) (available jerry s1200) (available jerry s1230)
    (available jerry s1300) (available jerry s1330) (available jerry s1400) (available jerry s1430)
    (available jerry s1500) (available jerry s1530) (available jerry s1600) (available jerry s1630)

    (available bradley s1130)
    (available bradley s1500)
    (available bradley s1530)
    (available bradley s1630)

    (preferred s1430)
    (preferred s1500)
    (preferred s1530)
    (preferred s1600)
    (preferred s1630)
  )

  (:goal (meeting_scheduled))
)