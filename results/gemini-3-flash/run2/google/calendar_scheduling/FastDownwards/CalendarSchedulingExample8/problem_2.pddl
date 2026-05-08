(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot
  )

  (:init
    ;; Adam's Available Slots (Busy: 10:00-10:30 [s3], 12:30-13:00 [s8], 13:30-14:30 [s10, s11])
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

    ;; Jerry's Available Slots (Busy: 9:00-9:30 [s1], 12:00-12:30 [s7], 15:00-16:00 [s13, s14])
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

    ;; Matthew's Available Slots (Busy: 9:30-11:00 [s2,s3,s4], 11:30-12:30 [s6,s7], 13:00-14:00 [s9,s10], 14:30-17:00 [s12-s16])
    (available matthew slot_0900_0930)
    (available matthew slot_1100_1130)
    (available matthew slot_1230_1300)
    (available matthew slot_1400_1430)
  )

  (:goal (meeting_scheduled))
)