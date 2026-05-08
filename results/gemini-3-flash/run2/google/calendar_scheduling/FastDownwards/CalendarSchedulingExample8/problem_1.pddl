(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    adam jerry matthew - person
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )

  (:init
    ;; Adam's Available Slots (Busy: 10:00-10:30, 12:30-13:00, 13:30-14:30)
    ;; Busy slots: s3, s8, s10, s11
    (available adam slot_0900_0930)
    (available adam slot_0930_1000)
    (available adam slot_1030_1100)
    (available adam slot_1100_1130)
    (available adam slot_1130_1200)
    (available adam slot_1200_1230)
    (available adam slot_1300_1330)
    (available adam slot_1430_1500)
    (available adam slot_1500_1530)
    (available adam slot_1530_1600)
    (available adam slot_1600_1630)
    (available adam slot_1630_1700)

    ;; Jerry's Available Slots (Busy: 9:00-9:30, 12:00-12:30, 15:00-16:00)
    ;; Busy slots: s1, s7, s13, s14
    (available jerry slot_0930_1000)
    (available jerry slot_1000_1030)
    (available jerry slot_1030_1100)
    (available jerry slot_1100_1130)
    (available jerry slot_1130_1200)
    (available jerry slot_1230_1300)
    (available jerry slot_1300_1330)
    (available jerry slot_1330_1400)
    (available jerry slot_1400_1430)
    (available jerry slot_1430_1500)
    (available jerry slot_1600_1630)
    (available jerry slot_1630_1700)

    ;; Matthew's Available Slots (Busy: 9:30-11:00, 11:30-12:30, 13:00-14:00, 14:30-17:00)
    ;; Busy slots: s2, s3, s4, s6, s7, s9, s10, s12, s13, s14, s15, s16
    (available matthew slot_0900_0930)
    (available matthew slot_1100_1130)
    (available matthew slot_1230_1300)
    (available matthew slot_1400_1430)
  )

  (:goal (meeting_scheduled))
)