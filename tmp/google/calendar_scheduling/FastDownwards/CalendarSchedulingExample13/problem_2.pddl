(define (problem meeting-monday-merge)
  (:domain meeting-schedule-merge)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time-slot
  )

  (:init
    ; Feasible common slots across Gerald, Barbara, and Roy (based on integrated availability)
    (free-gerald t1000)
    (free-barbara  t1000)
    (free-roy     t1000)

    (free-gerald t1030)
    (free-barbara  t1030)
    (free-roy     t1030)

    (free-gerald t1100)
    (free-barbara  t1100)
    (free-roy     t1100)

    (free-gerald t1400)
    (free-barbara  t1400)
    (free-roy     t1400)

  )

  (:goal (scheduled t1400))
)