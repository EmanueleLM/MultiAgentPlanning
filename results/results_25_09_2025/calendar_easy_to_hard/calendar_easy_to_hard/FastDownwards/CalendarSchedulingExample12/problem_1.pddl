(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time
  )

  (:init
    (time t0900) (time t0930) (time t1000) (time t1030) (time t1100) (time t1130)
    (time t1200) (time t1230) (time t1300) (time t1330) (time t1400) (time t1430)
    (time t1500) (time t1530) (time t1600) (time t1630) (time t1700)

    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630) (next t1630 t1700)

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

    (free kevin t1200) (free kevin t1230) (free kevin t1300) (free kevin t1330)
  )

  (:goal (meeting-scheduled))
)