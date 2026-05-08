(define (problem schedule-kcl-monday)
  (:domain calendar-meeting)
  (:objects
    kathryn charlotte lauren - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - timeslot
  )
  (:init
    (allowed t1000)
    (free kathryn t1000)
    (free charlotte t1000)
    (free lauren t1000)
  )
  (:goal (scheduled))
)