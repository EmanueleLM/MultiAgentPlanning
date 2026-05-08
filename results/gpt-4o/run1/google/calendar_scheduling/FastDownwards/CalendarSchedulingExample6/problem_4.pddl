(define (problem schedule_meeting_problem)
  (:domain meeting_scheduling)
  (:objects 
    thomas dylan jerry - person
    time_slot_0900_0930 time_slot_0930_1000 time_slot_1000_1030 
    time_slot_1030_1100 time_slot_1100_1130 time_slot_1130_1200 
    time_slot_1200_1230 time_slot_1230_1300 time_slot_1300_1330 
    time_slot_1330_1400 time_slot_1400_1430 time_slot_1430_1500 
    time_slot_1500_1530 time_slot_1530_1600 time_slot_1600_1630 
    time_slot_1630_1700 - time_slot
  )
  (:init 
    ; Define consecutive time slots
    (consecutive time_slot_0900_0930 time_slot_0930_1000)
    (consecutive time_slot_0930_1000 time_slot_1000_1030)
    (consecutive time_slot_1000_1030 time_slot_1030_1100)
    (consecutive time_slot_1100_1130 time_slot_1130_1200)
    (consecutive time_slot_1130_1200 time_slot_1200_1230)
    (consecutive time_slot_1200_1230 time_slot_1230_1300)
    (consecutive time_slot_1230_1300 time_slot_1300_1330)
    (consecutive time_slot_1330_1400 time_slot_1400_1430)
    (consecutive time_slot_1430_1500 time_slot_1500_1530)
    (consecutive time_slot_1500_1530 time_slot_1530_1600)
    (consecutive time_slot_1600_1630 time_slot_1630_1700)
    ; Availability for thomas
    (available thomas time_slot_0900_0930) (available thomas time_slot_0930_1000)
    (available thomas time_slot_1000_1030) (available thomas time_slot_1030_1100)
    (available thomas time_slot_1100_1130) (available thomas time_slot_1130_1200)
    (available thomas time_slot_1200_1230) (available thomas time_slot_1230_1300)
    (available thomas time_slot_1300_1330) (available thomas time_slot_1330_1400)
    (available thomas time_slot_1400_1430) (available thomas time_slot_1430_1500)
    (available thomas time_slot_1500_1530) (available thomas time_slot_1530_1600)
    (available thomas time_slot_1600_1630) (available thomas time_slot_1630_1700)
    ; Availability for dylan
    (available dylan time_slot_0900_0930) (available dylan time_slot_0930_1000)
    (available dylan time_slot_1000_1030)
    (available dylan time_slot_1100_1130) (available dylan time_slot_1130_1200)
    (available dylan time_slot_1200_1230) (available dylan time_slot_1230_1300)
    (available dylan time_slot_1300_1330)
    (available dylan time_slot_1400_1430) (available dylan time_slot_1430_1500)
    (available dylan time_slot_1500_1530) (available dylan time_slot_1530_1600)
    (available dylan time_slot_1600_1630) (available dylan time_slot_1630_1700)
    ; Availability for jerry
    (available jerry time_slot_1430_1500) (available jerry time_slot_1500_1530)
    (available jerry time_slot_1530_1600)
  )
  (:goal 
    (meeting_scheduled)
  )
)