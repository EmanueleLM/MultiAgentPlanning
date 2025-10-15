(define (problem CalendarSchedulingExample15)
  (:domain calendar-scheduling)
  (:objects
    jason william frances rachel - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )
  (:init
    (available jason s1000) (available jason s1100) (available jason s1200) (available jason s1300) (available jason s1330) (available jason s1430) (available jason s1500) (available jason s1530) (available jason s1600) (available jason s1630)
    (available william s0930) (available william s1000) (available william s1030) (available william s1100) (available william s1200) (available william s1230) (available william s1300) (available william s1330) (available william s1430) (available william s1500) (available william s1530) (available william s1600)
    (available frances s0930) (available frances s1030) (available frances s1230) (available frances s1300) (available frances s1600) (available frances s1630)
    (available rachel s0930) (available rachel s1030) (available rachel s1400) (available rachel s1600)
  )
  (:goal (and (chosen s1600) (scheduled)))
)