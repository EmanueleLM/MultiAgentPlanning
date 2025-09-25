(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling-multiagent)

  (:objects
    margaret donna helen - agent

    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    (available margaret t1000)
    (available margaret t1100)
    (available margaret t1200)
    (available margaret t1230)
    (available margaret t1330)
    (available margaret t1400)
    (available margaret t1430)
    (available margaret t1530)
    (available margaret t1600)
    (available margaret t1630)

    (available donna t0900)
    (available donna t0930)
    (available donna t1000)
    (available donna t1030)
    (available donna t1100)
    (available donna t1130)
    (available donna t1200)
    (available donna t1230)
    (available donna t1300)
    (available donna t1330)
    (available donna t1400)
    (available donna t1500)
    (available donna t1530)
    (available donna t1630)

    (available helen t0930)
    (available helen t1130)
    (available helen t1200)
    (available helen t1230)
  )

  (:goal (meeting-scheduled))
)