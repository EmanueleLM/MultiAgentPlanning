(define (problem calendarschedulingexample31)
  (:domain calendar_scheduling)
  (:objects
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; richard available: all slots between 9:00 and 17:00 except (13:30-14:00) and (15:00-15:30)
    (is_available richard slot_0900_0930)
    (is_available richard slot_0930_1000)
    (is_available richard slot_1000_1030)
    (is_available richard slot_1030_1100)
    (is_available richard slot_1100_1130)
    (is_available richard slot_1130_1200)
    (is_available richard slot_1200_1230)
    (is_available richard slot_1230_1300)
    (is_available richard slot_1300_1330)
    (is_available richard slot_1400_1430)
    (is_available richard slot_1430_1500)
    (is_available richard slot_1530_1600)
    (is_available richard slot_1600_1630)
    (is_available richard slot_1630_1700)

    ;; martha available: only slots starting at or after 14:00
    ;; (The prompt specifies Martha's busy slots as 9:00-9:30 and 13:00-13:30, 
    ;; but also she "do not want to meet... before 14:00", which makes those 10 slots unavailable)
    (is_available martha slot_1400_1430)
    (is_available martha slot_1430_1500)
    (is_available martha slot_1500_1530)
    (is_available martha slot_1530_1600)
    (is_available martha slot_1600_1630)
    (is_available martha slot_1630_1700)

    ;; kimberly available: all slots except busy windows (9:00-11:00, 11:30-12:00, 12:30-13:00, 14:00-16:00)
    (is_available kimberly slot_1100_1130)
    (is_available kimberly slot_1200_1230)
    (is_available kimberly slot_1300_1330)
    (is_available kimberly slot_1330_1400)
    (is_available kimberly slot_1600_1630)
    (is_available kimberly slot_1630_1700)
  )
  (:goal (meeting_scheduled))
)