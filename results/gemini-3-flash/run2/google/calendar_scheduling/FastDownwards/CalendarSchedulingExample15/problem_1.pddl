(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100
    t1100_1130 t1130_1200 t1200_1230 t1230_1300
    t1300_1330 t1330_1400 t1400_1430 t1430_1500
    t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Joyce's availability:
    ;; Joyce has meetings 11:00-11:30, 13:30-14:00, 14:30-16:30
    (free joyce t0900_0930)
    (free joyce t0930_1000)
    (free joyce t1000_1030)
    (free joyce t1030_1100)
    ;; 11:00 to 11:30 is busy
    (free joyce t1130_1200)
    (free joyce t1200_1230)
    (free joyce t1230_1300)
    (free joyce t1300_1330)
    ;; 13:30 to 14:00 is busy
    (free joyce t1400_1430)
    ;; 14:30 to 16:30 is busy (t1430, t1500, t1530, t1600)
    (free joyce t1630_1700)

    ;; Alexander's availability:
    ;; Alexander has meetings 9:00-11:00, 12:00-12:30, 13:30-15:00, 15:30-16:00, 16:30-17:00
    ;; 9:00 to 11:00 is busy (t0900, t0930, t1000, t1030)
    (free alexander t1100_1130)
    (free alexander t1130_1200)
    ;; 12:00 to 12:30 is busy
    (free alexander t1230_1300)
    (free alexander t1300_1330)
    ;; 13:30 to 15:00 is busy (t1330, t1400, t1430)
    (free alexander t1500_1530)
    ;; 15:30 to 16:00 is busy
    (free alexander t1600_1630)
    ;; 16:30 to 17:00 is busy

    ;; Christine's availability:
    ;; Christine has no meetings but cannot meet before 12:00
    ;; 9:00 to 12:00 is busy (t0900, t0930, t1000, t1030, t1100, t1130)
    (free christine t1200_1230)
    (free christine t1230_1300)
    (free christine t1300_1330)
    (free christine t1330_1400)
    (free christine t1400_1430)
    (free christine t1430_1500)
    (free christine t1500_1530)
    (free christine t1530_1600)
    (free christine t1600_1630)
    (free christine t1630_1700)
  )
  (:goal
    (meeting_scheduled)
  )
)