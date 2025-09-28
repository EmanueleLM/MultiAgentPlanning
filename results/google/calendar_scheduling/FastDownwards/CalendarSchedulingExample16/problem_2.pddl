(define (problem CalendarSchedulingExample16)
  (:domain calendar-scheduling)
  (:objects
    olivia anna virginia paul - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - time
  )
  (:init
    (available anna t0900) (available anna t0930) (available anna t1000) (available anna t1030)
    (available anna t1100) (available anna t1130) (available anna t1200) (available anna t1230)
    (available anna t1300) (available anna t1330) (available anna t1400) (available anna t1430)
    (available anna t1500) (available anna t1530) (available anna t1600)

    (available olivia t0900) (available olivia t0930) (available olivia t1000) (available olivia t1030)
    (available olivia t1100) (available olivia t1130)
    (available olivia t1330)
    (available olivia t1500) (available olivia t1530)

    (available virginia t1000) (available virginia t1030)

    (available paul t0930) (available paul t1000) (available paul t1030)
    (available paul t1130) (available paul t1200) (available paul t1230)
  )
  (:goal (scheduled))
)