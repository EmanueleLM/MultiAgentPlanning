(define (problem calendar_scheduling_example49)
  (:domain calendar_scheduling)
  (:objects
    teresa kathleen patricia - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - timeslot
  )
  (:init
    ;; Teresa availability based on busy periods: 
    ;; 9:00-10:00 (t0900, t0930), 13:00-13:30 (t1300), 14:00-14:30 (t1400), 15:00-15:30 (t1500), 16:30-17:00 (t1630)
    (available teresa t1000_1030)
    (available teresa t1030_1100)
    (available teresa t1100_1130)
    (available teresa t1130_1200)
    (available teresa t1200_1230)
    (available teresa t1230_1300)
    (available teresa t1330_1400)
    (available teresa t1430_1500)
    (available teresa t1530_1600)
    (available teresa t1600_1630)

    ;; Kathleen availability based on busy periods:
    ;; 9:00-9:30 (t0900), 12:30-13:00 (t1230), 13:30-14:00 (t1330), 15:00-15:30 (t1500)
    ;; preference "rather not meet after 14:30" modeled as unavailable for t1430 to t1700
    (available kathleen t0930_1000)
    (available kathleen t1000_1030)
    (available kathleen t1030_1100)
    (available kathleen t1100_1130)
    (available kathleen t1130_1200)
    (available kathleen t1200_1230)
    (available kathleen t1300_1330)
    (available kathleen t1400_1430)

    ;; Patricia availability based on busy periods:
    ;; 9:00-10:30 (t0900, t0930, t1000), 11:30-12:00 (t1130), 13:00-13:30 (t1300), 14:00-14:30 (t1400), 15:30-16:00 (t1530), 16:30-17:00 (t1630)
    (available patricia t1030_1100)
    (available patricia t1100_1130)
    (available patricia t1200_1230)
    (available patricia t1230_1300)
    (available patricia t1330_1400)
    (available patricia t1430_1500)
    (available patricia t1500_1530)
    (available patricia t1600_1630)
  )
  (:goal (meeting_scheduled))
)