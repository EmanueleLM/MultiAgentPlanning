(define (problem schedule-mon-30m)
  (:domain meeting-scheduler)
  (:objects
    adam jerry matthew - person
    ts-0900 ts-0930 ts-1000 ts-1030 ts-1100 ts-1130 ts-1200 ts-1230
    ts-1300 ts-1330 ts-1400 ts-1430 ts-1500 ts-1530 ts-1600 ts-1630 - timeslot
  )

  (:init
    (free adam ts-0900)
    (free adam ts-0930)
    (free adam ts-1030)
    (free adam ts-1100)
    (free adam ts-1130)
    (free adam ts-1200)
    (free adam ts-1300)
    (free adam ts-1430)
    (free adam ts-1500)
    (free adam ts-1530)
    (free adam ts-1600)
    (free adam ts-1630)

    (free jerry ts-0930)
    (free jerry ts-1000)
    (free jerry ts-1030)
    (free jerry ts-1100)
    (free jerry ts-1130)
    (free jerry ts-1230)
    (free jerry ts-1300)
    (free jerry ts-1330)
    (free jerry ts-1400)
    (free jerry ts-1430)
    (free jerry ts-1600)
    (free jerry ts-1630)

    (free matthew ts-0900)
    (free matthew ts-1100)
    (free matthew ts-1230)
    (free matthew ts-1400)
  )

  (:goal (meeting-scheduled))
)