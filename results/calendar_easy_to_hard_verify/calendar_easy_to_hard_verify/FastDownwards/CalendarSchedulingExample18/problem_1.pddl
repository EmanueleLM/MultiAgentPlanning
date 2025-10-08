(define (problem CalendarSchedulingExample18-prob)
  (:domain CalendarSchedulingExample18)
  (:objects
    s0900_0930 s0930_1000 s1000_1030 s1030_1100 s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500 s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )
  (:init
    ; lisa availability (cannot meet before 14:30; other busy intervals removed)
    (available lisa s1430_1500)
    (available lisa s1600_1630)
    (available lisa s1630_1700)
    ; dorothy availability
    (available dorothy s0930_1000)
    (available dorothy s1000_1030)
    (available dorothy s1130_1200)
    (available dorothy s1200_1230)
    (available dorothy s1230_1300)
    (available dorothy s1300_1330)
    (available dorothy s1400_1430)
    (available dorothy s1530_1600)
    (available dorothy s1600_1630)
    (available dorothy s1630_1700)
    ; anthony availability
    (available anthony s1000_1030)
    (available anthony s1030_1100)
    (available anthony s1230_1300)
    (available anthony s1400_1430)
    (available anthony s1430_1500)
    (available anthony s1630_1700)
    ; ryan availability
    (available ryan s1230_1300)
    (available ryan s1630_1700)
  )
  (:goal (meeting-scheduled))
)