(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    jesse nancy isabella harold linda - person
    meeting-room - room
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )
  (:init
    (unscheduled)
    (room-free meeting-room)
    (available jesse s0900_0930) (available jesse s0930_1000)
    (available jesse s1030_1100) (available jesse s1100_1130)
    (available jesse s1130_1200) (available jesse s1200_1230)
    (available jesse s1230_1300) (available jesse s1300_1330)
    (available jesse s1330_1400) (available jesse s1400_1430)
    (available jesse s1430_1500) (available jesse s1530_1600)
    (available jesse s1600_1630) (available jesse s1630_1700)
    (available nancy s0930_1000) (available nancy s1000_1030)
    (available nancy s1100_1130) (available nancy s1130_1200)
    (available nancy s1200_1230) (available nancy s1230_1300)
    (available nancy s1300_1330) (available nancy s1400_1430)
    (available nancy s1500_1530) (available nancy s1530_1600)
    (available nancy s1600_1630) (available nancy s1630_1700)
    (available isabella s1000_1030) (available isabella s1030_1100)
    (available isabella s1100_1130) (available isabella s1200_1230)
    (available isabella s1230_1300) (available isabella s1300_1330)
    (available isabella s1330_1400) (available isabella s1400_1430)
    (available isabella s1430_1500) (available isabella s1500_1530)
    (available isabella s1600_1630) (available isabella s1630_1700)
    (available harold s1000_1030)
    (available harold s1630_1700)
    (available linda s1000_1030) (available linda s1030_1100)
    (available linda s1100_1130) (available linda s1130_1200)
    (available linda s1230_1300) (available linda s1300_1330)
    (available linda s1600_1630) (available linda s1630_1700)
  )
  (:goal (and (scheduled s1630_1700)))
)