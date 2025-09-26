(define (problem schedule-mon-30m)
  (:domain meeting-scheduler)
  (:objects
    adam jerry matthew - person
    ts0900 ts0930 ts1000 ts1030 ts1100 ts1130 ts1200 ts1230
    ts1300 ts1330 ts1400 ts1430 ts1500 ts1530 ts1600 ts1630 - timeslot
  )

  (:init
    (free adam ts0900)
    (free adam ts0930)
    (free adam ts1030)
    (free adam ts1100)
    (free adam ts1130)
    (free adam ts1200)
    (free adam ts1300)
    (free adam ts1430)
    (free adam ts1500)
    (free adam ts1530)
    (free adam ts1600)
    (free adam ts1630)

    (free jerry ts0930)
    (free jerry ts1000)
    (free jerry ts1030)
    (free jerry ts1100)
    (free jerry ts1130)
    (free jerry ts1230)
    (free jerry ts1300)
    (free jerry ts1330)
    (free jerry ts1400)
    (free jerry ts1430)
    (free jerry ts1600)
    (free jerry ts1630)

    (free matthew ts0900)
    (free matthew ts1100)
    (free matthew ts1230)
    (free matthew ts1400)
  )

  (:goal (meeting-scheduled))
)