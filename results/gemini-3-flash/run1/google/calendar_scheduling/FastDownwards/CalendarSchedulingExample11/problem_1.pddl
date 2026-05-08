(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )
  (:init
    ;; Alexander is free: 09:00-09:30, 10:00-10:30, 11:00-11:30, 11:30-12:00, 12:00-12:30, 13:00-13:30, 13:30-14:00, 14:00-14:30, 15:00-15:30, 15:30-16:00
    (person_free alexander t0900_0930)
    (person_free alexander t1000_1030)
    (person_free alexander t1100_1130)
    (person_free alexander t1130_1200)
    (person_free alexander t1200_1230)
    (person_free alexander t1300_1330)
    (person_free alexander t1330_1400)
    (person_free alexander t1400_1430)
    (person_free alexander t1500_1530)
    (person_free alexander t1530_1600)

    ;; Elizabeth is free: 09:30-10:00, 10:00-10:30, 10:30-11:00, 11:00-11:30, 12:30-13:00, 14:30-15:00, 15:00-15:30, 15:30-16:00, 16:00-16:30, 16:30-17:00
    (person_free elizabeth t0930_1000)
    (person_free elizabeth t1000_1030)
    (person_free elizabeth t1030_1100)
    (person_free elizabeth t1100_1130)
    (person_free elizabeth t1230_1300)
    (person_free elizabeth t1430_1500)
    (person_free elizabeth t1500_1530)
    (person_free elizabeth t1530_1600)
    (person_free elizabeth t1600_1630)
    (person_free elizabeth t1630_1700)

    ;; Walter is free: 14:30-15:00, 15:00-15:30
    (person_free walter t1430_1500)
    (person_free walter t1500_1530)
  )
  (:goal (is_scheduled))
)