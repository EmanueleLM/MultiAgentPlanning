(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - timeslot
  )
  (:init
    ;; Gregory has blocked Monday during 11:00 to 11:30, 12:00 to 12:30, 15:30 to 16:30
    (busy gregory t_1100_1130)
    (busy gregory t_1200_1230)
    (busy gregory t_1530_1600)
    (busy gregory t_1600_1630)

    ;; Teresa's calendar is wide open the entire day (no busy predicates)

    ;; Carol has blocked Monday during 9:00 to 10:30, 11:00 to 16:00, 16:30 to 17:00
    ;; 9:00 to 10:30 (3 half-hour slots)
    (busy carol t_0900_0930)
    (busy carol t_0930_1000)
    (busy carol t_1000_1030)
    ;; 11:00 to 16:00 (10 half-hour slots)
    (busy carol t_1100_1130)
    (busy carol t_1130_1200)
    (busy carol t_1200_1230)
    (busy carol t_1230_1300)
    (busy carol t_1300_1330)
    (busy carol t_1330_1400)
    (busy carol t_1400_1430)
    (busy carol t_1430_1500)
    (busy carol t_1500_1530)
    (busy carol t_1530_1600)
    ;; 16:30 to 17:00 (1 half-hour slot)
    (busy carol t_1630_1700)
  )
  (:goal (meeting_scheduled))
)