(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    (available karen t1030) (available karen t1100) (available karen t1130)
    (available karen t1200) (available karen t1230) (available karen t1300)
    (available karen t1330) (available karen t1400) (available karen t1430)
    (available karen t1500) (available karen t1530) (available karen t1600)
    (available brandon t0900) (available brandon t1000) (available brandon t1100)
    (available brandon t1230) (available brandon t1300) (available brandon t1330)
    (available brandon t1400) (available brandon t1430) (available brandon t1500)
    (available brandon t1600)
    (available donald t1030) (available donald t1400)
    (available kelly t0930) (available kelly t1000) (available kelly t1100)
    (available kelly t1200) (available kelly t1230) (available kelly t1300)
    (available kelly t1400) (available kelly t1530)
  )
  (:goal (scheduled t1400))
)