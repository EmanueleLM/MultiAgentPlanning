(define (problem schedule_meeting_14)
  (:domain calendar_scheduling)
  (:objects
    brandon jerry bradley - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )
  (:init
    ;; Jerry has no meetings all day (9:00 to 17:00).
    (free jerry t0900_0930) (free jerry t0930_1000) (free jerry t1000_1030) (free jerry t1030_1100) (free jerry t1100_1130) (free jerry t1130_1200) (free jerry t1200_1230) (free jerry t1230_1300) (free jerry t1300_1330) (free jerry t1330_1400) (free jerry t1400_1430) (free jerry t1430_1500) (free jerry t1500_1530) (free jerry t1530_1600) (free jerry t1600_1630) (free jerry t1630_1700)
    
    ;; Brandon's busy times: 13:00-14:00, 15:30-16:00, 16:30-17:00.
    ;; Brandon's hard constraint (avoid before 14:30).
    ;; Resulting availability: 14:30-15:00, 15:00-15:30, 16:00-16:30.
    (free brandon t1430_1500)
    (free brandon t1500_1530)
    (free brandon t1600_1630)
    
    ;; Bradley's busy times: 9:00-11:30, 12:00-15:00, 16:00-16:30.
    ;; Resulting availability: 11:30-12:00, 15:00-15:30, 15:30-16:00, 16:30-17:00.
    (free bradley t1130_1200)
    (free bradley t1500_1530)
    (free bradley t1530_1600)
    (free bradley t1630_1700)
  )
  (:goal (meeting_scheduled brandon jerry bradley))
)