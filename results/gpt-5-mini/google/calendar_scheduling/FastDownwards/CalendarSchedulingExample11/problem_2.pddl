(define (problem schedule-meeting-monday)
  (:domain calendar_scheduling)

  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )

  (:init
    ;; timeline adjacency (kept for possible extensions)
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

    ;; meeting not yet scheduled
    (meeting_not_scheduled)

    ;; Alexander busy: 09:30-10:00, 10:30-11:00, 12:30-13:00, 14:30-15:00, 16:00-17:00
    ;; therefore Alexander is free in all other work-hour slots:
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

    ;; Elizabeth busy: 09:00-09:30, 11:30-12:30, 13:00-14:30
    ;; Elizabeth free for the other slots:
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

    ;; Walter busy: 09:00-14:30 and 15:30-17:00
    ;; Walter free only in these 30-min slots:
    (free walter t1430_1500)
    (free walter t1500_1530)
  )

  ;; Goal: find any valid 30-minute slot where the meeting can be scheduled for all participants
  (:goal (meeting_scheduled))
)