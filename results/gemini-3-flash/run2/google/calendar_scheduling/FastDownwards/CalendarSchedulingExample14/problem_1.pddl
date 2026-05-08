(define (problem schedule_meeting_14)
  (:domain calendar_scheduling)
  (:objects
    brandon jerry bradley - person
    t0900_0930 t0930_1000 t1000_1030 t1030_1100 t1100_1130 t1130_1200 t1200_1230 t1230_1300 t1300_1330 t1330_1400 t1400_1430 t1430_1500 t1500_1530 t1530_1600 t1600_1630 t1630_1700 - slot
  )
  (:init
    ;; Jerry has no meetings all day (9:00 to 17:00)
    (available jerry t0900_0930) (available jerry t0930_1000) (available jerry t1000_1030) (available jerry t1030_1100) (available jerry t1100_1130) (available jerry t1130_1200) (available jerry t1200_1230) (available jerry t1230_1300) (available jerry t1300_1330) (available jerry t1330_1400) (available jerry t1400_1430) (available jerry t1430_1500) (available jerry t1500_1530) (available jerry t1530_1600) (available jerry t1600_1630) (available jerry t1630_1700)
    
    ;; Brandon's meetings: 13:00-14:00, 15:30-16:00, 16:30-17:00
    ;; Brandon's preference: Avoid meetings before 14:30
    ;; Combining constraints, Brandon is available at:
    ;; 14:30-15:00, 15:00-15:30, 16:00-16:30
    (available brandon t1430_1500)
    (available brandon t1500_1530)
    (available brandon t1600_1630)
    
    ;; Bradley's meetings: 9:00-11:30, 12:00-15:00, 16:00-16:30
    ;; Bradley is available at:
    ;; 11:30-12:00, 15:00-15:30, 15:30-16:00, 16:30-17:00
    (available bradley t1130_1200)
    (available bradley t1500_1530)
    (available bradley t1530_1600)
    (available bradley t1630_1700)
  )
  (:goal (done))
)