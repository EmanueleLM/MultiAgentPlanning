(define (problem calendar_scheduling_example_37)
  (:domain calendar_scheduling)
  (:objects
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - timeslot
  )
  (:init
    ;; Gregory's schedule: 11:00 to 11:30, 12:00 to 12:30, 15:30 to 16:30
    (is_busy gregory t_1100_1130)
    (is_busy gregory t_1200_1230)
    (is_busy gregory t_1530_1600)
    (is_busy gregory t_1600_1630)

    ;; Teresa's calendar is wide open, so no is_busy facts.

    ;; Carol's schedule: 9:00 to 10:30, 11:00 to 16:00, 16:30 to 17:00
    (is_busy carol t_0900_0930)
    (is_busy carol t_0930_1000)
    (is_busy carol t_1000_1030)
    (is_busy carol t_1100_1130)
    (is_busy carol t_1130_1200)
    (is_busy carol t_1200_1230)
    (is_busy carol t_1230_1300)
    (is_busy carol t_1300_1330)
    (is_busy carol t_1330_1400)
    (is_busy carol t_1400_1430)
    (is_busy carol t_1430_1500)
    (is_busy carol t_1500_1530)
    (is_busy carol t_1530_1600)
    (is_busy carol t_1630_1700)
  )
  (:goal (meeting_scheduled))
)