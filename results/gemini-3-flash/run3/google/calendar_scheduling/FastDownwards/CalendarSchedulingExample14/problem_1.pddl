(define (problem calendarschedulingexample14)
  (:domain calendar_scheduling)
  (:objects
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Brandon's available slots (Free after 14:30 and not during 13:00-14:00, 15:30-16:00, 16:30-17:00)
    (available brandon slot_1430_1500)
    (available brandon slot_1500_1530)
    (available brandon slot_1600_1630)

    ;; Jerry's available slots (No meetings the whole day 09:00 to 17:00)
    (available jerry slot_0900_0930)
    (available jerry slot_0930_1000)
    (available jerry slot_1000_1030)
    (available jerry slot_1030_1100)
    (available jerry slot_1100_1130)
    (available jerry slot_1130_1200)
    (available jerry slot_1200_1230)
    (available jerry slot_1230_1300)
    (available jerry slot_1300_1330)
    (available jerry slot_1330_1400)
    (available jerry slot_1400_1430)
    (available jerry slot_1430_1500)
    (available jerry slot_1500_1530)
    (available jerry slot_1530_1600)
    (available jerry slot_1600_1630)
    (available jerry slot_1630_1700)

    ;; Bradley's available slots (Free outside 09:00-11:30, 12:00-15:00, 16:00-16:30)
    (available bradley slot_1130_1200)
    (available bradley slot_1500_1530)
    (available bradley slot_1530_1600)
    (available bradley slot_1630_1700)
  )
  (:goal (meeting_scheduled))
)