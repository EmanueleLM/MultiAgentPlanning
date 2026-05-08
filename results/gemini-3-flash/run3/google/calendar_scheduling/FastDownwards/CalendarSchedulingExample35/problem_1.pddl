(define (problem calendar_problem)
  (:domain calendar_domain)
  (:objects
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Bradley's free slots (9:00 to 17:00, with preference for after 14:30)
    ;; Treating Bradley's preference "do not want to meet before 14:30" as a hard constraint.
    (free bradley slot_1430_1500)
    (free bradley slot_1500_1530)
    (free bradley slot_1530_1600)
    (free bradley slot_1600_1630)
    (free bradley slot_1630_1700)

    ;; Zachary's free slots (All except 10:00-10:30 and 15:00-15:30)
    (free zachary slot_0900_0930)
    (free zachary slot_0930_1000)
    ;; 10:00-10:30 is busy
    (free zachary slot_1030_1100)
    (free zachary slot_1100_1130)
    (free zachary slot_1130_1200)
    (free zachary slot_1200_1230)
    (free zachary slot_1230_1300)
    (free zachary slot_1300_1330)
    (free zachary slot_1330_1400)
    (free zachary slot_1400_1430)
    (free zachary slot_1430_1500)
    ;; 15:00-15:30 is busy
    (free zachary slot_1530_1600)
    (free zachary slot_1600_1630)
    (free zachary slot_1630_1700)

    ;; Teresa's free slots (Remaining slots after removing blocked windows)
    ;; Blocked: 9:00-10:30, 11:00-12:30, 13:00-14:00, 14:30-16:30
    (free teresa slot_1030_1100)
    (free teresa slot_1230_1300)
    (free teresa slot_1400_1430)
    (free teresa slot_1630_1700)
  )
  (:goal (meeting_scheduled))
)