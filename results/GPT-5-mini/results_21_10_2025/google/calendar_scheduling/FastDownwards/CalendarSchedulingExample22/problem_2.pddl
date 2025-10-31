(define (problem schedule-mon-60)
  (:domain meeting-scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    theresa charles betty - person
  )

  (:init
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    (free theresa t0930) (free theresa t1000) (free theresa t1030) (free theresa t1100)
    (free theresa t1130) (free theresa t1200) (free theresa t1330)
    (free theresa t1500) (free theresa t1530) (free theresa t1600)

    (free charles t0900) (free charles t0930)
    (free charles t1030) (free charles t1100)
    (free charles t1230) (free charles t1300) (free charles t1330)
    (free charles t1530) (free charles t1600) (free charles t1630)

    (free betty t1030) (free betty t1100) (free betty t1130)
    (free betty t1230)
    (free betty t1400) (free betty t1430)
    (free betty t1600) (free betty t1630)
  )

  (:goal
    (meeting-scheduled)
  )
)