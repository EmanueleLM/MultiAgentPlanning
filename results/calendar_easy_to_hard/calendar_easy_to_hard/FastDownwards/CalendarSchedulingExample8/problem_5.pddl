(define (problem schedule-mon-30m)
  (:domain meeting-scheduler)
  (:objects
    adam jerry matthew - person
    ts_0900 ts_0930 ts_1000 ts_1030 ts_1100 ts_1130 ts_1200 ts_1230
    ts_1300 ts_1330 ts_1400 ts_1430 ts_1500 ts_1530 ts_1600 ts_1630 - timeslot
  )

  (:init
    (free adam ts_0900)
    (free adam ts_0930)
    (free adam ts_1030)
    (free adam ts_1100)
    (free adam ts_1130)
    (free adam ts_1200)
    (free adam ts_1300)
    (free adam ts_1430)
    (free adam ts_1500)
    (free adam ts_1530)
    (free adam ts_1600)
    (free adam ts_1630)

    (free jerry ts_0930)
    (free jerry ts_1000)
    (free jerry ts_1030)
    (free jerry ts_1100)
    (free jerry ts_1130)
    (free jerry ts_1230)
    (free jerry ts_1300)
    (free jerry ts_1330)
    (free jerry ts_1400)
    (free jerry ts_1430)
    (free jerry ts_1600)
    (free jerry ts_1630)

    (free matthew ts_0900)
    (free matthew ts_1100)
    (free matthew ts_1230)
    (free matthew ts_1400)
  )

  (:goal (meeting-scheduled))
)