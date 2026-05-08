(define (problem calendar_scheduling_example_41)
  (:domain calendar_scheduling)
  (:objects
    alan nancy patricia - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Identify unique person objects
    (is_alan alan)
    (is_nancy nancy)
    (is_patricia patricia)

    ;; Alan: wide open, but preference not to meet before 14:30
    (free alan t1430_1500)
    (free alan t1500_1530)
    (free alan t1530_1600)
    (free alan t1600_1630)
    (free alan t1630_1700)

    ;; Nancy: blocked 11:00-12:30, 13:00-13:30, 14:00-15:00
    (free nancy t0900_0930)
    (free nancy t0930_1000)
    (free nancy t1000_1030)
    (free nancy t1030_1100)
    ;; 11:00 to 12:30 busy
    (free nancy t1230_1300)
    ;; 13:00 to 13:30 busy
    (free nancy t1330_1400)
    ;; 14:00 to 15:00 busy
    (free nancy t1500_1530)
    (free nancy t1530_1600)
    (free nancy t1600_1630)
    (free nancy t1630_1700)

    ;; Patricia: blocked 10:00-12:00, 12:30-13:00, 13:30-16:00
    (free patricia t0900_0930)
    (free patricia t0930_1000)
    ;; 10:00 to 12:00 busy
    (free patricia t1200_1230)
    ;; 12:30 to 13:00 busy
    (free patricia t1300_1330)
    ;; 13:30 to 16:00 busy
    (free patricia t1600_1630)
    (free patricia t1630_1700)
  )
  (:goal
    (meeting_scheduled)
  )
)