(define (problem CalendarSchedulingExample48-problem)
  (:domain CalendarSchedulingExample48)
  (:objects
    noah teresa bradley philip joyce ryan aaron orchestrator - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (available noah s0900) (available noah s0930) (available noah s1000) (available noah s1030)
    (available noah s1100) (available noah s1130) (available noah s1200) (available noah s1230)
    (available noah s1300) (available noah s1330) (available noah s1400) (available noah s1430)
    (available noah s1500) (available noah s1530) (available noah s1600) (available noah s1630)

    (available teresa s0900) (available teresa s0930) (available teresa s1000) (available teresa s1030)
    (available teresa s1200) (available teresa s1230) (available teresa s1300) (available teresa s1330)
    (available teresa s1500) (available teresa s1530)

    (available bradley s0930) (available bradley s1030) (available bradley s1100) (available bradley s1130)
    (available bradley s1200) (available bradley s1230) (available bradley s1300) (available bradley s1330)
    (available bradley s1400) (available bradley s1430) (available bradley s1530) (available bradley s1630)

    (available philip s0930) (available philip s1000) (available philip s1030) (available philip s1100)
    (available philip s1200) (available philip s1300) (available philip s1330) (available philip s1400)
    (available philip s1430) (available philip s1500) (available philip s1530) (available philip s1600)

    (available joyce s0900) (available joyce s1000) (available joyce s1030) (available joyce s1100)
    (available joyce s1230) (available joyce s1300) (available joyce s1430) (available joyce s1500)

    (available ryan s1030) (available ryan s1130) (available ryan s1200) (available ryan s1230)
    (available ryan s1300) (available ryan s1330)

    (available aaron s0900) (available aaron s0930) (available aaron s1200) (available aaron s1230)
    (available aaron s1300) (available aaron s1330) (available aaron s1430) (available aaron s1630)
  )
  (:goal (scheduled))
)