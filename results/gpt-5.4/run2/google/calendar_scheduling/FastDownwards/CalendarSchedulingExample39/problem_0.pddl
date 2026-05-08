(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    emily victoria nancy - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    (open)
    (current t0900)

    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)

    (free emily t0900)
    (free emily t0930)
    (free emily t1000)
    (free emily t1030)
    (free emily t1100)
    (free emily t1130)
    (free emily t1200)
    (free emily t1230)
    (free emily t1300)
    (free emily t1330)
    (free emily t1400)
    (free emily t1430)
    (free emily t1500)
    (free emily t1530)
    (free emily t1600)
    (free emily t1630)

    (free victoria t0900)
    (free victoria t0930)
    (free victoria t1000)
    (free victoria t1030)
    (free victoria t1100)
    (free victoria t1130)
    (free victoria t1200)
    (free victoria t1230)
    (free victoria t1300)
    (free victoria t1400)
    (free victoria t1530)
    (free victoria t1600)

    (free nancy t1400)
    (free nancy t1530)
    (free nancy t1600)
    (free nancy t1630)
  )

  (:goal
    (and
      (scheduled t1400)
      (not (open))
    )
  )
)