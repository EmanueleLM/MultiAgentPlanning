(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - timeslot
  )
  (:init
    ;; Alan: wide open 9:00-17:00 but preference not before 14:30
    (available alan slot_1430_1500)
    (available alan slot_1500_1530)
    (available alan slot_1530_1600)
    (available alan slot_1600_1630)
    (available alan slot_1630_1700)

    ;; Nancy: blocked 11:00-12:30, 13:00-13:30, 14:00-15:00
    (available nancy slot_0900_0930)
    (available nancy slot_0930_1000)
    (available nancy slot_1000_1030)
    (available nancy slot_1030_1100)
    (available nancy slot_1230_1300)
    (available nancy slot_1330_1400)
    (available nancy slot_1500_1530)
    (available nancy slot_1530_1600)
    (available nancy slot_1600_1630)
    (available nancy slot_1630_1700)

    ;; Patricia: blocked 10:00-12:00, 12:30-13:00, 13:30-16:00
    (available patricia slot_0900_0930)
    (available patricia slot_0930_1000)
    (available patricia slot_1200_1230)
    (available patricia slot_1300_1330)
    (available patricia slot_1600_1630)
    (available patricia slot_1630_1700)
  )
  (:goal
    (meeting_scheduled)
  )
)