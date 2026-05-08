(define (problem calendar_scheduling_example_6)
  (:domain calendar_scheduling)
  (:objects
    thomas dylan jerry - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Adjacency constraints for the day (Monday 09:00 - 17:00)
    (next slot_0900_0930 slot_0930_1000)
    (next slot_0930_1000 slot_1000_1030)
    (next slot_1000_1030 slot_1030_1100)
    (next slot_1030_1100 slot_1100_1130)
    (next slot_1100_1130 slot_1130_1200)
    (next slot_1130_1200 slot_1200_1230)
    (next slot_1200_1230 slot_1230_1300)
    (next slot_1230_1300 slot_1300_1330)
    (next slot_1300_1330 slot_1330_1400)
    (next slot_1330_1400 slot_1400_1430)
    (next slot_1400_1430 slot_1430_1500)
    (next slot_1430_1500 slot_1500_1530)
    (next slot_1500_1530 slot_1530_1600)
    (next slot_1530_1600 slot_1600_1630)
    (next slot_1600_1630 slot_1630_1700)

    ;; Thomas is wide open the entire day
    (free thomas slot_0900_0930) (free thomas slot_0930_1000)
    (free thomas slot_1000_1030) (free thomas slot_1030_1100)
    (free thomas slot_1100_1130) (free thomas slot_1130_1200)
    (free thomas slot_1200_1230) (free thomas slot_1230_1300)
    (free thomas slot_1300_1330) (free thomas slot_1330_1400)
    (free thomas slot_1400_1430) (free thomas slot_1430_1500)
    (free thomas slot_1500_1530) (free thomas slot_1530_1600)
    (free thomas slot_1600_1630) (free thomas slot_1630_1700)

    ;; Dylan busy: 10:30-11:00, 13:30-14:00
    (free dylan slot_0900_0930) (free dylan slot_0930_1000)
    (free dylan slot_1000_1030) 
    ;; slot_1030_1100 busy
    (free dylan slot_1100_1130) (free dylan slot_1130_1200)
    (free dylan slot_1200_1230) (free dylan slot_1230_1300)
    (free dylan slot_1300_1330) 
    ;; slot_1330_1400 busy
    (free dylan slot_1400_1430) (free dylan slot_1430_1500)
    (free dylan slot_1500_1530) (free dylan slot_1530_1600)
    (free dylan slot_1600_1630) (free dylan slot_1630_1700)

    ;; Jerry busy: 9:00-11:00, 11:30-14:30, 16:00-17:00
    ;; Jerry free: 11:00-11:30, 14:30-16:00
    (free jerry slot_1100_1130)
    (free jerry slot_1430_1500)
    (free jerry slot_1500_1530)
    (free jerry slot_1530_1600)
  )
  (:goal (meeting_scheduled))
)