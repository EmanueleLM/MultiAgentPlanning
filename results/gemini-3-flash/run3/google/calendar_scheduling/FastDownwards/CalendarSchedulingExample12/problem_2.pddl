(define (problem calendar_scheduling_example_12)
  (:domain calendar_scheduling)
  (:objects
    s0900_0930 s0930_1000 s1000_1030 s1030_1100 s1100_1130 s1130_1200 s1200_1230 s1230_1300 s1300_1330 s1330_1400 s1400_1430 s1430_1500 s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )
  (:init
    ;; Time continuity for the workday 9:00 to 17:00
    (consecutive s0900_0930 s0930_1000)
    (consecutive s0930_1000 s1000_1030)
    (consecutive s1000_1030 s1030_1100)
    (consecutive s1030_1100 s1100_1130)
    (consecutive s1100_1130 s1130_1200)
    (consecutive s1130_1200 s1200_1230)
    (consecutive s1200_1230 s1230_1300)
    (consecutive s1230_1300 s1300_1330)
    (consecutive s1300_1330 s1330_1400)
    (consecutive s1330_1400 s1400_1430)
    (consecutive s1400_1430 s1430_1500)
    (consecutive s1430_1500 s1500_1530)
    (consecutive s1500_1530 s1530_1600)
    (consecutive s1530_1600 s1600_1630)
    (consecutive s1600_1630 s1630_1700)

    ;; David is free the whole day
    (free david s0900_0930) (free david s0930_1000) (free david s1000_1030) (free david s1030_1100)
    (free david s1100_1130) (free david s1130_1200) (free david s1200_1230) (free david s1230_1300)
    (free david s1300_1330) (free david s1330_1400) (free david s1400_1430) (free david s1430_1500)
    (free david s1500_1530) (free david s1530_1600) (free david s1600_1630) (free david s1630_1700)

    ;; Debra's schedule
    ;; Busy: 9:30-10:00 (s0930), 11:00-11:30 (s1100), 12:00-13:00 (s1200, s1230), 14:00-14:30 (s1400), 16:00-16:30 (s1600)
    (free debra s0900_0930)
    (free debra s1000_1030)
    (free debra s1030_1100)
    (free debra s1130_1200)
    (free debra s1300_1330)
    (free debra s1330_1400)
    (free debra s1430_1500)
    (free debra s1500_1530)
    (free debra s1530_1600)
    (free debra s1630_1700)

    ;; Kevin's schedule
    ;; Busy: 9:00-12:00 (s0900-s1130), 14:00-17:00 (s1400-s1630)
    (free kevin s1200_1230)
    (free kevin s1230_1300)
    (free kevin s1300_1330)
    (free kevin s1330_1400)
  )
  (:goal (meeting_scheduled))
)