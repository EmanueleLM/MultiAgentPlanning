(define (problem schedule_monday)
  (:domain calendar_scheduling)
  (:objects
    donna john billy - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )
  (:init
    ;; Donna is busy on Monday during 14:00 to 14:30, 15:30 to 16:00
    (available donna slot_0900_0930)
    (available donna slot_0930_1000)
    (available donna slot_1000_1030)
    (available donna slot_1030_1100)
    (available donna slot_1100_1130)
    (available donna slot_1130_1200)
    (available donna slot_1200_1230)
    (available donna slot_1230_1300)
    (available donna slot_1300_1330)
    (available donna slot_1330_1400)
    ;; 14:00 to 14:30 is busy
    (available donna slot_1430_1500)
    (available donna slot_1500_1530)
    ;; 15:30 to 16:00 is busy
    (available donna slot_1600_1630)
    (available donna slot_1630_1700)

    ;; John is busy on Monday during 11:00 to 11:30, 16:30 to 17:00
    (available john slot_0900_0930)
    (available john slot_0930_1000)
    (available john slot_1000_1030)
    (available john slot_1030_1100)
    ;; 11:00 to 11:30 is busy
    (available john slot_1130_1200)
    (available john slot_1200_1230)
    (available john slot_1230_1300)
    (available john slot_1300_1330)
    (available john slot_1330_1400)
    (available john slot_1400_1430)
    (available john slot_1430_1500)
    (available john slot_1500_1530)
    (available john slot_1530_1600)
    (available john slot_1600_1630)
    ;; 16:30 to 17:00 is busy

    ;; Billy is busy on Monday during 9:00 to 10:00, 10:30 to 14:00, 14:30 to 17:00
    ;; 9:00 to 10:00 is busy
    (available billy slot_1000_1030)
    ;; 10:30 to 14:00 is busy
    (available billy slot_1400_1430)
    ;; 14:30 to 17:00 is busy
  )
  (:goal (meeting_scheduled))
)