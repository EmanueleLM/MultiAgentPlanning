(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630
  )

  (:init
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030)
    (next t1030 t1100) (next t1100 t1130) (next t1130 t1200)
    (next t1200 t1230) (next t1230 t1300) (next t1300 t1330)
    (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    (free michelle t0900) (free michelle t0930) (free michelle t1000) (free michelle t1030)
    (free michelle t1200) (free michelle t1230) (free michelle t1300) (free michelle t1330)
    (free michelle t1400) (free michelle t1430) (free michelle t1500) (free michelle t1530)
    (free michelle t1600) (free michelle t1630)

    (free steven t0930) (free steven t1000) (free steven t1030) (free steven t1100)
    (free steven t1200) (free steven t1230) (free steven t1300)
    (free steven t1400) (free steven t1430) (free steven t1500)
    (free steven t1600) (free steven t1630)

    (free jerry t0930) (free jerry t1100) (free jerry t1230)
    (free jerry t1430) (free jerry t1500) (free jerry t1600)
  )

  (:goal (scheduled t1430))
)