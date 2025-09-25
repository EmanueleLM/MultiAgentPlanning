(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    david debra kevin - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    (unscheduled)

    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    (free david t0900) (free david t0930) (free david t1000) (free david t1030)
    (free david t1100) (free david t1130) (free david t1200) (free david t1230)
    (free david t1300) (free david t1330) (free david t1400) (free david t1430)
    (free david t1500) (free david t1530) (free david t1600) (free david t1630)

    (free debra t0900)
    (free debra t1000) (free debra t1030)
    (free debra t1130)
    (free debra t1300) (free debra t1330)
    (free debra t1430) (free debra t1500) (free debra t1530)
    (free debra t1630)

    (free kevin t0900) (free kevin t0930) (free kevin t1000) (free kevin t1030)
    (free kevin t1100) (free kevin t1130)
    (free kevin t1400) (free kevin t1430) (free kevin t1500) (free kevin t1530)
    (free kevin t1600) (free kevin t1630)
  )

  (:goal (meeting-done))
)