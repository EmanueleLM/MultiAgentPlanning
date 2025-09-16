(define (problem meeting-monday-merge)
  (:domain meeting-schedule-merge)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time-slot
  )

  (:init
    ; Gerald's preference: avoid meetings before 13:00, so only 14:00-14:30 is considered feasible here
    (free-gerald t1400)
    ; Barbara's and Roy's availability aligned for the chosen slot
    (free-barbara t1400)
    (free-roy     t1400)
  )

  (:goal (scheduled t1400))
)