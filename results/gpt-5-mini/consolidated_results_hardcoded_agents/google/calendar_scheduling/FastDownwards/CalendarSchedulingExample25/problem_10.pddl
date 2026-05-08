(define (problem schedule_meeting_problem)
  (:domain schedule_meeting)
  (:objects
    anthony pamela zachary - participant

    seg_0900_0930 seg_0930_1000 seg_1000_1030 seg_1030_1100 seg_1100_1130
    seg_1130_1200 seg_1200_1230 seg_1230_1300 seg_1300_1330 seg_1330_1400
    seg_1400_1430 seg_1430_1500 seg_1500_1530 seg_1530_1600 seg_1600_1630
    seg_1630_1700 - segment

    slot_1330_1430 - slot
  )

  (:init
    ;; Order of contiguous 30-minute segments across the work day (explicit successor relation).
    (next seg_0900_0930 seg_0930_1000)
    (next seg_0930_1000 seg_1000_1030)
    (next seg_1000_1030 seg_1030_1100)
    (next seg_1030_1100 seg_1100_1130)
    (next seg_1100_1130 seg_1130_1200)
    (next seg_1130_1200 seg_1200_1230)
    (next seg_1200_1230 seg_1230_1300)
    (next seg_1230_1300 seg_1300_1330)
    (next seg_1300_1330 seg_1330_1400)
    (next seg_1330_1400 seg_1400_1430)
    (next seg_1400_1430 seg_1430_1500)
    (next seg_1430_1500 seg_1500_1530)
    (next seg_1500_1530 seg_1530_1600)
    (next seg_1530_1600 seg_1600_1630)
    (next seg_1600_1630 seg_1630_1700)

    ;; Slot composition: the audited recommended 60-minute slot covers two contiguous segments.
    (covers slot_1330_1430 seg_1330_1400)
    (covers slot_1330_1430 seg_1400_1430)

    ;; Availabilities for the recommended slot segments (derived from input schedules).
    ;; Anthony free on both segments 13:30-14:00 and 14:00-14:30.
    (available anthony seg_1330_1400)
    (available anthony seg_1400_1430)

    ;; Pamela free on both segments and she requested no meetings after 14:30 (slot ends at 14:30).
    (available pamela seg_1330_1400)
    (available pamela seg_1400_1430)

    ;; Zachary free on both segments (his busy slots do not include 13:30-14:30).
    (available zachary seg_1330_1400)
    (available zachary seg_1400_1430)
  )

  (:goal (scheduled))
)