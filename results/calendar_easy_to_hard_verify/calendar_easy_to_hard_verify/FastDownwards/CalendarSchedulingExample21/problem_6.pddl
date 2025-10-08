(define (problem schedule-mon)
  (:domain schedule-meeting)
  (:objects
    sara sarah shirley harold terry - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (free sara s0900) (free sara s0930) (free sara s1000) (free sara s1030)
    (free sara s1100) (free sara s1130) (free sara s1200) (free sara s1230)
    (free sara s1300) (free sara s1330) (free sara s1400) (free sara s1430)
    (free sara s1500) (free sara s1530) (free sara s1600) (free sara s1630)

    (free sarah s0900) (free sarah s0930) (free sarah s1000) (free sarah s1030)
    (free sarah s1100) (free sarah s1130) (free sarah s1230) (free sarah s1300)
    (free sarah s1330) (free sarah s1400) (free sarah s1430) (free sarah s1530)
    (free sarah s1600) (free sarah s1630)

    (free shirley s0900) (free shirley s0930) (free shirley s1000) (free shirley s1030)
    (free shirley s1100) (free shirley s1130) (free shirley s1200) (free shirley s1230)
    (free shirley s1300) (free shirley s1400) (free shirley s1500) (free shirley s1530)
    (free shirley s1600) (free shirley s1630)

    (free harold s1000) (free harold s1230)

    (free terry s1000) (free terry s1130)
  )
  (:goal (meeting-scheduled))
)