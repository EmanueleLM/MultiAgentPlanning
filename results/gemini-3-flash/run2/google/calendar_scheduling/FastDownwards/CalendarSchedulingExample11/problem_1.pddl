(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    alexander elizabeth walter - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100 slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300 slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500 slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - timeslot
  )
  (:init
    ;; Alexander availability
    (available alexander slot_0900_0930)
    ;; Busy 9:30-10:00 (slot_0930_1000)
    (available alexander slot_1000_1030)
    ;; Busy 10:30-11:00 (slot_1030_1100)
    (available alexander slot_1100_1130)
    (available alexander slot_1130_1200)
    (available alexander slot_1200_1230)
    ;; Busy 12:30-13:00 (slot_1230_1300)
    (available alexander slot_1300_1330)
    (available alexander slot_1330_1400)
    (available alexander slot_1400_1430)
    ;; Busy 14:30-15:00 (slot_1430_1500)
    (available alexander slot_1500_1530)
    (available alexander slot_1530_1600)
    ;; Busy 16:00-17:00 (slot_1600_1630, slot_1630_1700)

    ;; Elizabeth availability
    ;; Busy 9:00-9:30 (slot_0900_0930)
    (available elizabeth slot_0930_1000)
    (available elizabeth slot_1000_1030)
    (available elizabeth slot_1030_1100)
    (available elizabeth slot_1100_1130)
    ;; Busy 11:30-12:30 (slot_1130_1200, slot_1200_1230)
    (available elizabeth slot_1230_1300)
    ;; Busy 13:00-14:30 (slot_1300_1330, slot_1330_1400, slot_1400_1430)
    (available elizabeth slot_1430_1500)
    (available elizabeth slot_1500_1530)
    (available elizabeth slot_1530_1600)
    (available elizabeth slot_1600_1630)
    (available elizabeth slot_1630_1700)

    ;; Walter availability
    ;; Busy 9:00-14:30 (slot_0900_0930 to slot_1400_1430)
    (available walter slot_1430_1500)
    (available walter slot_1500_1530)
    ;; Busy 15:30-17:00 (slot_1530_1600, slot_1600_1630, slot_1630_1700)
  )
  (:goal
    (meeting_scheduled)
  )
)