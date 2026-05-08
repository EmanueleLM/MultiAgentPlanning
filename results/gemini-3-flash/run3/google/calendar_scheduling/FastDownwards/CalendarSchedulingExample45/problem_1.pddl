(define (problem calendar_scheduling_example_45)
  (:domain calendar_scheduling)
  (:objects
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100 
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300 
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500 
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - timeslot
  )
  (:init
    (at_time t_0900_0930)

    ;; Succession of time slots
    (next t_0900_0930 t_0930_1000)
    (next t_0930_1000 t_1000_1030)
    (next t_1000_1030 t_1030_1100)
    (next t_1030_1100 t_1100_1130)
    (next t_1100_1130 t_1130_1200)
    (next t_1130_1200 t_1200_1230)
    (next t_1200_1230 t_1230_1300)
    (next t_1230_1300 t_1300_1330)
    (next t_1300_1330 t_1330_1400)
    (next t_1330_1400 t_1400_1430)
    (next t_1400_1430 t_1430_1500)
    (next t_1430_1500 t_1500_1530)
    (next t_1500_1530 t_1530_1600)
    (next t_1530_1600 t_1600_1630)
    (next t_1600_1630 t_1630_1700)

    ;; Samuel's blocked times (Andrew and Grace are always free)
    ;; 09:00 to 10:30 (3 slots)
    (slot_busy t_0900_0930)
    (slot_busy t_0930_1000)
    (slot_busy t_1000_1030)
    
    ;; 11:30 to 12:00 (1 slot)
    (slot_busy t_1130_1200)
    
    ;; 13:00 to 13:30 (1 slot)
    (slot_busy t_1300_1330)
    
    ;; 14:00 to 16:00 (4 slots)
    (slot_busy t_1400_1430)
    (slot_busy t_1430_1500)
    (slot_busy t_1500_1530)
    (slot_busy t_1530_1600)
    
    ;; 16:30 to 17:00 (1 slot)
    (slot_busy t_1630_1700)

    ;; Available slots (Intersection of everyone's availability)
    (slot_available t_1030_1100)
    (slot_available t_1100_1130)
    (slot_available t_1200_1230)
    (slot_available t_1230_1300)
    (slot_available t_1330_1400)
    (slot_available t_1600_1630)
  )
  (:goal (meeting_held))
)