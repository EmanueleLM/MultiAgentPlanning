(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    (unscheduled)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)
    (free denise t0900) (free denise t0930) (free denise t1000) (free denise t1030)
    (free denise t1100) (free denise t1130) (free denise t1200) (free denise t1230)
    (free denise t1300) (free denise t1330) (free denise t1400) (free denise t1430)
    (free denise t1500) (free denise t1530) (free denise t1600) (free denise t1630)
    (free joseph t0900) (free joseph t0930) (free joseph t1000) (free joseph t1030)
    (free joseph t1100) (free joseph t1130) (free joseph t1200) (free joseph t1230)
    (free joseph t1300) (free joseph t1330) (free joseph t1400) (free joseph t1430)
    (free joseph t1500) (free joseph t1530) (free joseph t1600) (free joseph t1630)
    (free henry t0930) (free henry t1030) (free henry t1100) (free henry t1130)
    (free henry t1430) (free henry t1600)
    (free christian t1100) (free christian t1130) (free christian t1200) (free christian t1230)
    (free christian t1300) (free christian t1330) (free christian t1400) (free christian t1530)
  )
  (:goal (and
    (meeting-start t1100)
  ))
)