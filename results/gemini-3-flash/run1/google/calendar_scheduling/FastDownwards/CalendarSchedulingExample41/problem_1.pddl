(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects 
    alan nancy patricia - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Alan: wide open, but does not want to meet before 14:30.
    ;; We model "before 14:30" as busy on all slots starting before 14:30.
    (is_busy alan t0900_0930)
    (is_busy alan t0930_1000)
    (is_busy alan t1000_1030)
    (is_busy alan t1030_1100)
    (is_busy alan t1100_1130)
    (is_busy alan t1130_1200)
    (is_busy alan t1200_1230)
    (is_busy alan t1230_1300)
    (is_busy alan t1300_1330)
    (is_busy alan t1330_1400)
    (is_busy alan t1400_1430)

    ;; Nancy: blocked 11:00 to 12:30, 13:00 to 13:30, 14:00 to 15:00.
    (is_busy nancy t1100_1130)
    (is_busy nancy t1130_1200)
    (is_busy nancy t1200_1230)
    (is_busy nancy t1300_1330)
    (is_busy nancy t1400_1430)
    (is_busy nancy t1430_1500)

    ;; Patricia: blocked 10:00 to 12:00, 12:30 to 13:00, 13:30 to 16:00.
    (is_busy patricia t1000_1030)
    (is_busy patricia t1030_1100)
    (is_busy patricia t1100_1130)
    (is_busy patricia t1130_1200)
    (is_busy patricia t1230_1300)
    (is_busy patricia t1330_1400)
    (is_busy patricia t1400_1430)
    (is_busy patricia t1430_1500)
    (is_busy patricia t1500_1530)
    (is_busy patricia t1530_1600)
  )
  (:goal (meeting_success))
)