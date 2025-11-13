(define (problem schedule-kcl-monday)
  (:domain calendar-meeting)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    (succ t0900 t0930) (succ t0930 t1000) (succ t1000 t1030) (succ t1030 t1100)
    (succ t1100 t1130) (succ t1130 t1200) (succ t1200 t1230) (succ t1230 t1300)
    (succ t1300 t1330) (succ t1330 t1400) (succ t1400 t1430) (succ t1430 t1500)
    (succ t1500 t1530) (succ t1530 t1600) (succ t1600 t1630)

    (allowed t1000) (allowed t1100) (allowed t1230) (allowed t1300)

    (free kathryn t0930) (free kathryn t1000) (free kathryn t1100) (free kathryn t1200)
    (free kathryn t1230) (free kathryn t1300) (free kathryn t1430) (free kathryn t1500)
    (free kathryn t1530) (free kathryn t1600)

    (free charlotte t0900) (free charlotte t0930) (free charlotte t1000) (free charlotte t1030)
    (free charlotte t1100) (free charlotte t1130) (free charlotte t1230) (free charlotte t1300)

    (free lauren t1000) (free lauren t1030) (free lauren t1100) (free lauren t1130)
    (free lauren t1230) (free lauren t1300) (free lauren t1430) (free lauren t1600)
  )
  (:goal (scheduled))
)