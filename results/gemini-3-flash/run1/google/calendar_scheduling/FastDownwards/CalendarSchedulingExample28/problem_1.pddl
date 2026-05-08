(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    brittany emily doris - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Starting time
    (at_slot slot_0900_0930)

    ;; Temporal succession
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

    ;; Emily availability (free all day)
    (available emily slot_0900_0930)
    (available emily slot_0930_1000)
    (available emily slot_1000_1030)
    (available emily slot_1030_1100)
    (available emily slot_1100_1130)
    (available emily slot_1130_1200)
    (available emily slot_1200_1230)
    (available emily slot_1230_1300)
    (available emily slot_1300_1330)
    (available emily slot_1330_1400)
    (available emily slot_1400_1430)
    (available emily slot_1430_1500)
    (available emily slot_1500_1530)
    (available emily slot_1530_1600)
    (available emily slot_1600_1630)
    (available emily slot_1630_1700)

    ;; Brittany availability (busy 13:00-13:30 and 16:00-16:30)
    (available brittany slot_0900_0930)
    (available brittany slot_0930_1000)
    (available brittany slot_1000_1030)
    (available brittany slot_1030_1100)
    (available brittany slot_1100_1130)
    (available brittany slot_1130_1200)
    (available brittany slot_1200_1230)
    (available brittany slot_1230_1300)
    ;; Slot 13:00-13:30 is busy
    (available brittany slot_1330_1400)
    (available brittany slot_1400_1430)
    (available brittany slot_1430_1500)
    (available brittany slot_1500_1530)
    (available brittany slot_1530_1600)
    ;; Slot 16:00-16:30 is busy
    (available brittany slot_1630_1700)

    ;; Doris availability (busy 09:00-11:00, 11:30-14:30, 15:00-17:00)
    ;; Gaps are 11:00-11:30 and 14:30-15:00
    (available doris slot_1100_1130)
    (available doris slot_1430_1500)
  )
  (:goal
    (meeting_scheduled)
  )
)