(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:init
    ; Adam (busy s1000, s1230)
    (available adam s0900) (available adam s0930) (available adam s1030) (available adam s1100)
    (available adam s1130) (available adam s1200) (available adam s1300) (available adam s1330)
    (available adam s1400) (available adam s1430) (available adam s1500) (available adam s1530)
    (available adam s1600) (available adam s1630)

    ; Frances (busy s1230, s1400)
    (available frances s0900) (available frances s0930) (available frances s1000) (available frances s1030)
    (available frances s1100) (available frances s1130) (available frances s1200) (available frances s1300)
    (available frances s1330) (available frances s1430) (available frances s1500) (available frances s1530)
    (available frances s1600) (available frances s1630)

    ; Natalie (busy s1030, s1230, s1300, s1600)
    (available natalie s0900) (available natalie s0930) (available natalie s1000) (available natalie s1100)
    (available natalie s1130) (available natalie s1200) (available natalie s1330) (available natalie s1400)
    (available natalie s1430) (available natalie s1500) (available natalie s1530) (available natalie s1630)

    ; Patrick (busy s1030, s1200, s1230, s1300, s1330, s1430, s1500, s1530)
    (available patrick s0900) (available patrick s0930) (available patrick s1000) (available patrick s1100)
    (available patrick s1130) (available patrick s1400) (available patrick s1600) (available patrick s1630)

    ; Willie (busy s0900, s0930, s1030, s1100, s1200, s1230, s1400, s1430, s1500, s1600)
    (available willie s1000) (available willie s1130) (available willie s1300) (available willie s1330)
    (available willie s1530) (available willie s1630)

    ; Diana (busy s0900, s0930, s1000, s1100..s1600)
    (available diana s1030) (available diana s1630)
  )
  (:goal (meeting-scheduled))
)