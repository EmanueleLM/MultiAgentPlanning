(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    alexander elizabeth walter - person
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100 t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300 t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500 t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - timeslot
  )
  (:init
    ;; Identity predicates for participants
    (is_alexander alexander)
    (is_elizabeth elizabeth)
    (is_walter walter)

    ;; Alexander's free slots
    ;; (Busy: 9:30-10:00, 10:30-11:00, 12:30-13:00, 14:30-15:00, 16:00-17:00)
    (free alexander t_0900_0930)
    (free alexander t_1000_1030)
    (free alexander t_1100_1130)
    (free alexander t_1130_1200)
    (free alexander t_1200_1230)
    (free alexander t_1300_1330)
    (free alexander t_1330_1400)
    (free alexander t_1400_1430)
    (free alexander t_1500_1530)
    (free alexander t_1530_1600)

    ;; Elizabeth's free slots
    ;; (Busy: 9:00-9:30, 11:30-12:30, 13:00-14:30)
    (free elizabeth t_0930_1000)
    (free elizabeth t_1000_1030)
    (free elizabeth t_1030_1100)
    (free elizabeth t_1100_1130)
    (free elizabeth t_1230_1300)
    (free elizabeth t_1430_1500)
    (free elizabeth t_1500_1530)
    (free elizabeth t_1530_1600)
    (free elizabeth t_1600_1630)
    (free elizabeth t_1630_1700)

    ;; Walter's free slots
    ;; (Busy: 9:00-14:30, 15:30-17:00)
    (free walter t_1430_1500)
    (free walter t_1500_1530)
  )
  (:goal (scheduled))
)