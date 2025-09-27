(define (problem CalendarSchedulingExample11-problem)
  (:domain CalendarSchedulingExample11)
  (:objects madison linda logan virginia - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time)
  (:init
    (free madison t0) (free madison t1) (free madison t3) (free madison t4) (free madison t5) (free madison t6) (free madison t7) (free madison t8) (free madison t9) (free madison t10) (free madison t12) (free madison t14)
    (free linda t0) (free linda t1) (free linda t2) (free linda t3) (free linda t4) (free linda t5) (free linda t6) (free linda t7) (free linda t8) (free linda t9) (free linda t10) (free linda t11) (free linda t12) (free linda t13) (free linda t14) (free linda t15)
    (free logan t6) (free logan t14)
    (free virginia t0) (free virginia t4) (free virginia t6) (free virginia t7) (free virginia t11) (free virginia t13)
  )
  (:goal (meeting_scheduled))
)