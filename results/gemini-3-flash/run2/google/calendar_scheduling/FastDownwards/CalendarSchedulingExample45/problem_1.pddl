(define (problem calendar_scheduling_example45)
  (:domain calendar_scheduling)
  (:objects
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Time progression starts at the beginning of the work day
    (at_slot slot_0900_0930)

    ;; Defining the temporal sequence of 30-minute blocks
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

    ;; Andrew is wide open the entire day
    (free andrew slot_0900_0930)
    (free andrew slot_0930_1000)
    (free andrew slot_1000_1030)
    (free andrew slot_1030_1100)
    (free andrew slot_1100_1130)
    (free andrew slot_1130_1200)
    (free andrew slot_1200_1230)
    (free andrew slot_1230_1300)
    (free andrew slot_1300_1330)
    (free andrew slot_1330_1400)
    (free andrew slot_1400_1430)
    (free andrew slot_1430_1500)
    (free andrew slot_1500_1530)
    (free andrew slot_1530_1600)
    (free andrew slot_1600_1630)
    (free andrew slot_1630_1700)

    ;; Grace has no meetings the whole day
    (free grace slot_0900_0930)
    (free grace slot_0930_1000)
    (free grace slot_1000_1030)
    (free grace slot_1030_1100)
    (free grace slot_1100_1130)
    (free grace slot_1130_1200)
    (free grace slot_1200_1230)
    (free grace slot_1230_1300)
    (free grace slot_1300_1330)
    (free grace slot_1330_1400)
    (free grace slot_1400_1430)
    (free grace slot_1430_1500)
    (free grace slot_1500_1530)
    (free grace slot_1530_1600)
    (free grace slot_1600_1630)
    (free grace slot_1630_1700)

    ;; Samuel's free availability inferred from blocks:
    ;; Blocked: 09:00-10:30, 11:30-12:00, 13:00-13:30, 14:00-16:00, 16:30-17:00
    (free samuel slot_1030_1100)
    (free samuel slot_1100_1130)
    (free samuel slot_1200_1230)
    (free samuel slot_1230_1300)
    (free samuel slot_1330_1400)
    (free samuel slot_1600_1630)
  )
  (:goal (scheduled))
)