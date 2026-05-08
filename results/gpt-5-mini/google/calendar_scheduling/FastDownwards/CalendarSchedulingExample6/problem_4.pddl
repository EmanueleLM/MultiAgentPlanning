(define (problem schedule_meeting_monday)
  (:domain meeting_scheduling)

  (:objects
    s_0900 s_0930 s_1000 s_1030 s_1100 s_1130 s_1200 s_1230
    s_1300 s_1330 s_1400 s_1430 s_1500 s_1530 s_1600 s_1630 - slot
  )

  (:init
    (succ s_0900 s_0930) (succ s_0930 s_1000) (succ s_1000 s_1030) (succ s_1030 s_1100)
    (succ s_1100 s_1130) (succ s_1130 s_1200) (succ s_1200 s_1230) (succ s_1230 s_1300)
    (succ s_1300 s_1330) (succ s_1330 s_1400) (succ s_1400 s_1430) (succ s_1430 s_1500)
    (succ s_1500 s_1530) (succ s_1530 s_1600) (succ s_1600 s_1630)

    (available thomas s_0900) (available thomas s_0930) (available thomas s_1000) (available thomas s_1030)
    (available thomas s_1100) (available thomas s_1130) (available thomas s_1200) (available thomas s_1230)
    (available thomas s_1300) (available thomas s_1330) (available thomas s_1400) (available thomas s_1430)
    (available thomas s_1500) (available thomas s_1530) (available thomas s_1600) (available thomas s_1630)

    (available dylan s_0900) (available dylan s_0930) (available dylan s_1000)
    (available dylan s_1100) (available dylan s_1130) (available dylan s_1200) (available dylan s_1230) (available dylan s_1300)
    (available dylan s_1400) (available dylan s_1430) (available dylan s_1500) (available dylan s_1530) (available dylan s_1600) (available dylan s_1630)

    (available jerry s_1430) (available jerry s_1500) (available jerry s_1530)
  )

  (:goal (meeting_scheduled s_1430 s_1500))
)