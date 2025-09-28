(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:init
    (available adam s0900) (available adam s0930) (available adam s1030) (available adam s1100)
    (available adam s1130) (available adam s1200) (available adam s1300) (available adam s1330)
    (available adam s1400) (available adam s1430) (available adam s1500) (available adam s1530)
    (available adam s1600) (available adam s1630)

    (available frances s0900) (available frances s0930) (available frances s1000) (available frances s1030)
    (available frances s1100) (available frances s1130) (available frances s1200) (available frances s1300)
    (available frances s1330) (available frances s1430) (available frances s1500) (available frances s1530)
    (available frances s1600) (available frances s1630)

    (available natalie s0900) (available natalie s0930) (available natalie s1000) (available natalie s1100)
    (available natalie s1130) (available natalie s1200) (available natalie s1330) (available natalie s1400)
    (available natalie s1430) (available natalie s1500) (available natalie s1530) (available natalie s1630)

    (available patrick s0900) (available patrick s0930) (available patrick s1000) (available patrick s1100)
    (available patrick s1130) (available patrick s1400) (available patrick s1600) (available patrick s1630)

    (available willie s1000) (available willie s1130) (available willie s1300) (available willie s1330)
    (available willie s1530) (available willie s1630)

    (available diana s1030) (available diana s1630)
  )
  (:goal (meeting-scheduled))
  (:metric minimize (total-cost))
)