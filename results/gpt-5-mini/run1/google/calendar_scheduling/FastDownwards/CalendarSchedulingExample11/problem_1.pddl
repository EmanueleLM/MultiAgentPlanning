(define (problem schedule-meeting-monday)
  (:domain scheduling)

  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )

  (:init
    (next t0900_0930 t0930_1000)
    (next t0930_1000 t1000_1030)
    (next t1000_1030 t1030_1100)
    (next t1030_1100 t1100_1130)
    (next t1100_1130 t1130_1200)
    (next t1130_1200 t1200_1230)
    (next t1200_1230 t1230_1300)
    (next t1230_1300 t1300_1330)
    (next t1300_1330 t1330_1400)
    (next t1330_1400 t1400_1430)
    (next t1400_1430 t1430_1500)
    (next t1430_1500 t1500_1530)
    (next t1500_1530 t1530_1600)
    (next t1530_1600 t1600_1630)
    (next t1600_1630 t1630_1700)

    (meeting-not-scheduled)

    (free alexander t0900_0930)
    (free alexander t1000_1030)
    (free alexander t1100_1130)
    (free alexander t1130_1200)
    (free alexander t1200_1230)
    (free alexander t1300_1330)
    (free alexander t1330_1400)
    (free alexander t1400_1430)
    (free alexander t1500_1530)
    (free alexander t1530_1600)

    (free elizabeth t0930_1000)
    (free elizabeth t1000_1030)
    (free elizabeth t1030_1100)
    (free elizabeth t1100_1130)
    (free elizabeth t1230_1300)
    (free elizabeth t1430_1500)
    (free elizabeth t1500_1530)
    (free elizabeth t1530_1600)
    (free elizabeth t1600_1630)
    (free elizabeth t1630_1700)

    (free walter t1430_1500)
    (free walter t1500_1530)
  )

  (:goal (and
    (meeting-scheduled)
    (meeting-at t1500_1530)
    (attending alexander t1500_1530)
    (attending elizabeth t1500_1530)
    (attending walter t1500_1530)
  ))
)