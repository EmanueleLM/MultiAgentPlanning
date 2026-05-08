(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling_domain)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Gabriel is free the whole day (9:00 to 17:00)
    (is_free gabriel t0900_0930) (is_free gabriel t0930_1000) (is_free gabriel t1000_1030) (is_free gabriel t1030_1100)
    (is_free gabriel t1100_1130) (is_free gabriel t1130_1200) (is_free gabriel t1200_1230) (is_free gabriel t1230_1300)
    (is_free gabriel t1300_1330) (is_free gabriel t1330_1400) (is_free gabriel t1400_1430) (is_free gabriel t1430_1500)
    (is_free gabriel t1500_1530) (is_free gabriel t1530_1600) (is_free gabriel t1600_1630) (is_free gabriel t1630_1700)

    ;; Scott is busy 9:30-10:30, 13:30-14:00, 14:30-15:00, 15:30-16:00, 16:30-17:00
    ;; Scott free slots:
    (is_free scott t0900_0930)
    (is_free scott t1030_1100)
    (is_free scott t1100_1130)
    (is_free scott t1130_1200)
    (is_free scott t1200_1230)
    (is_free scott t1230_1300)
    (is_free scott t1300_1330)
    (is_free scott t1400_1430)
    (is_free scott t1500_1530)
    (is_free scott t1600_1630)

    ;; Christine is busy 9:00-10:00, 10:30-12:30, 13:00-17:00
    ;; Christine free slots:
    (is_free christine t1000_1030)
    (is_free christine t1230_1300)
  )
  (:goal (meeting_scheduled))
)