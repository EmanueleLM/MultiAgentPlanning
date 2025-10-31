(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    (free dylan t0900) (free dylan t0930) (free dylan t1000) (free dylan t1030)
    (free dylan t1100) (free dylan t1130) (free dylan t1200) (free dylan t1230)
    (free dylan t1300) (free dylan t1330) (free dylan t1500) (free dylan t1530)
    (free dylan t1600) (free dylan t1630)

    (free kathryn t0930) (free kathryn t1030) (free kathryn t1100) (free kathryn t1130)
    (free kathryn t1200) (free kathryn t1230) (free kathryn t1300) (free kathryn t1330)
    (free kathryn t1400) (free kathryn t1430) (free kathryn t1500) (free kathryn t1530)
    (free kathryn t1600) (free kathryn t1630)

    (free hannah t1030) (free hannah t1100) (free hannah t1130) (free hannah t1200)
    (free hannah t1530) (free hannah t1630)

    (free anna t1100) (free anna t1130) (free anna t1400) (free anna t1500) (free anna t1530) (free anna t1630)
  )

  (:goal
    (or
      (meeting-scheduled t0900) (meeting-scheduled t0930) (meeting-scheduled t1000)
      (meeting-scheduled t1030) (meeting-scheduled t1100) (meeting-scheduled t1130)
      (meeting-scheduled t1200) (meeting-scheduled t1230) (meeting-scheduled t1300)
      (meeting-scheduled t1330) (meeting-scheduled t1400) (meeting-scheduled t1430)
      (meeting-scheduled t1500) (meeting-scheduled t1530) (meeting-scheduled t1600)
    )
  )

  (:metric minimize (total-cost))
)