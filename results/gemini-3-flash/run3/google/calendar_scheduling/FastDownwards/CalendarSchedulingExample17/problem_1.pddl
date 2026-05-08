(define (problem calendar_problem_17)
  (:domain calendar_scheduling)
  (:objects
    margaret donna helen - person
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100 t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300 t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500 t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - timeslot
  )
  (:init
    ;; Margaret free slots:
    ;; Margaret is blocked: 09:00-10:00, 10:30-11:00, 11:30-12:00, 13:00-13:30, 15:00-15:30
    (is_free margaret t_1000_1030)
    (is_free margaret t_1100_1130)
    (is_free margaret t_1200_1230)
    (is_free margaret t_1230_1300)
    (is_free margaret t_1330_1400)
    (is_free margaret t_1400_1430)
    (is_free margaret t_1430_1500)
    (is_free margaret t_1530_1600)
    (is_free margaret t_1600_1630)
    (is_free margaret t_1630_1700)

    ;; Donna free slots:
    ;; Donna is blocked: 14:30-15:00, 16:00-16:30
    (is_free donna t_0900_0930)
    (is_free donna t_0930_1000)
    (is_free donna t_1000_1030)
    (is_free donna t_1030_1100)
    (is_free donna t_1100_1130)
    (is_free donna t_1130_1200)
    (is_free donna t_1200_1230)
    (is_free donna t_1230_1300)
    (is_free donna t_1300_1330)
    (is_free donna t_1330_1400)
    (is_free donna t_1400_1430)
    (is_free donna t_1500_1530)
    (is_free donna t_1530_1600)
    (is_free donna t_1630_1700)

    ;; Helen free slots:
    ;; Helen has meetings: 09:00-09:30, 10:00-11:30, 13:00-14:00, 14:30-15:00, 15:30-17:00
    ;; Helen preference: no meeting after 13:30 (meaning slots starting at 13:30 onwards are out)
    ;; Combining these, Helen is only potentially free during:
    ;; 09:30-10:00, 11:30-12:00, 12:00-12:30, 12:30-13:00
    (is_free helen t_0930_1000)
    (is_free helen t_1130_1200)
    (is_free helen t_1200_1230)
    (is_free helen t_1230_1300)
  )
  (:goal (goal_achieved))
)