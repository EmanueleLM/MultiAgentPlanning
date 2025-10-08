(define (problem schedule-monday)
  (:domain meeting-scheduling)
  (:objects
    elijah janet brian carl timothy - participant
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )

  (:init
    (available elijah t0900_0930)
    (available elijah t0930_1000)
    (available elijah t1100_1130)
    (available elijah t1230_1300)
    (available elijah t1300_1330)
    (available elijah t1330_1400)
    (available elijah t1400_1430)
    (available elijah t1430_1500)
    (available elijah t1530_1600)
    (available elijah t1600_1630)
    (available elijah t1630_1700)

    (available janet t0900_0930)
    (available janet t1030_1100)
    (available janet t1100_1130)
    (available janet t1130_1200)
    (available janet t1200_1230)
    (available janet t1230_1300)
    (available janet t1300_1330)
    (available janet t1530_1600)
    (available janet t1600_1630)
    (available janet t1630_1700)

    (available carl t0900_0930)
    (available carl t1630_1700)

    (available timothy t0900_0930)
    (available timothy t0930_1000)
    (available timothy t1000_1030)
    (available timothy t1200_1230)
    (available timothy t1230_1300)
    (available timothy t1300_1330)
    (available timothy t1400_1430)
    (available timothy t1600_1630)
  )

  (:goal (meeting-scheduled))
)