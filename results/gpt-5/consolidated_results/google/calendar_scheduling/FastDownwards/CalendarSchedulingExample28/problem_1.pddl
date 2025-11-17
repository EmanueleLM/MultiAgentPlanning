(define (problem schedule_calendar_scheduling_example28)
  (:domain calendar_scheduling_example28)
  (:objects
    brittany emily doris - participant
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )
  (:init
    (participant brittany)
    (participant emily)
    (participant doris)

    (slot s0900_0930)
    (slot s0930_1000)
    (slot s1000_1030)
    (slot s1030_1100)
    (slot s1100_1130)
    (slot s1130_1200)
    (slot s1200_1230)
    (slot s1230_1300)
    (slot s1300_1330)
    (slot s1330_1400)
    (slot s1400_1430)
    (slot s1430_1500)
    (slot s1500_1530)
    (slot s1530_1600)
    (slot s1600_1630)
    (slot s1630_1700)

    ; Brittany free (busy at 13:00-13:30 and 16:00-16:30)
    (free brittany s0900_0930)
    (free brittany s0930_1000)
    (free brittany s1000_1030)
    (free brittany s1030_1100)
    (free brittany s1100_1130)
    (free brittany s1130_1200)
    (free brittany s1200_1230)
    (free brittany s1230_1300)
    (free brittany s1330_1400)
    (free brittany s1400_1430)
    (free brittany s1430_1500)
    (free brittany s1500_1530)
    (free brittany s1530_1600)
    (free brittany s1630_1700)

    ; Emily free all day
    (free emily s0900_0930)
    (free emily s0930_1000)
    (free emily s1000_1030)
    (free emily s1030_1100)
    (free emily s1100_1130)
    (free emily s1130_1200)
    (free emily s1200_1230)
    (free emily s1230_1300)
    (free emily s1300_1330)
    (free emily s1330_1400)
    (free emily s1400_1430)
    (free emily s1430_1500)
    (free emily s1500_1530)
    (free emily s1530_1600)
    (free emily s1600_1630)
    (free emily s1630_1700)

    ; Doris free only at 11:00-11:30 and 14:30-15:00
    (free doris s1100_1130)
    (free doris s1430_1500)

    ; Audited mutually free slots for all three
    (mutual s1100_1130)
    (mutual s1430_1500)

    ; Earliest feasible slot
    (earliest s1100_1130)
  )
  (:goal (and
    (meeting-selected)
    (attending brittany)
    (attending emily)
    (attending doris)))
)