(define (problem schedule_38)
  (:domain calendar_scheduling)
  (:objects
    catherine michael alexander - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100 slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300 slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500 slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Catherine is available during these slots
    (person_available catherine slot_0900_0930)
    (person_available catherine slot_0930_1000)
    (person_available catherine slot_1000_1030)
    ;; 10:30 to 11:00 is busy
    (person_available catherine slot_1100_1130)
    (person_available catherine slot_1130_1200)
    (person_available catherine slot_1200_1230)
    ;; 12:30 to 13:30 is busy
    (person_available catherine slot_1330_1400)
    (person_available catherine slot_1400_1430)
    ;; 14:30 to 15:00 is busy
    (person_available catherine slot_1500_1530)
    (person_available catherine slot_1530_1600)
    (person_available catherine slot_1600_1630)
    (person_available catherine slot_1630_1700)

    ;; Michael is available during these slots
    (person_available michael slot_0900_0930)
    ;; 09:30 to 10:30 is busy
    (person_available michael slot_1030_1100)
    (person_available michael slot_1100_1130)
    (person_available michael slot_1130_1200)
    ;; 12:00 to 13:00 is busy
    (person_available michael slot_1300_1330)
    ;; 13:30 to 14:00 is busy
    (person_available michael slot_1400_1430)
    (person_available michael slot_1430_1500)
    ;; 15:00 to 15:30 is busy
    (person_available michael slot_1530_1600)
    (person_available michael slot_1600_1630)
    (person_available michael slot_1630_1700)

    ;; Alexander is available during these slots
    ;; 09:00 to 09:30 is busy
    (person_available alexander slot_0930_1000)
    ;; 10:00 to 10:30 is busy
    (person_available alexander slot_1030_1100)
    ;; 11:00 to 12:00 is busy
    (person_available alexander slot_1200_1230)
    (person_available alexander slot_1230_1300)
    ;; 13:00 to 13:30 is busy
    (person_available alexander slot_1330_1400)
    ;; 14:00 to 16:00 is busy
    (person_available alexander slot_1600_1630)
    ;; 16:30 to 17:00 is busy
  )
  (:goal (meeting_scheduled))
)