(define (problem monday-30min-instance)
  (:domain monday-30min-scheduling)
  (:objects
    joyce christine alexander - participant
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
  )
  (:init
    (open)

    (participant joyce)
    (participant christine)
    (participant alexander)

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

    (available joyce s0900_0930)
    (available joyce s0930_1000)
    (available joyce s1000_1030)
    (available joyce s1030_1100)
    (available joyce s1130_1200)
    (available joyce s1200_1230)
    (available joyce s1230_1300)
    (available joyce s1300_1330)
    (available joyce s1400_1430)
    (available joyce s1630_1700)

    (available christine s1200_1230)
    (available christine s1230_1300)
    (available christine s1300_1330)
    (available christine s1330_1400)
    (available christine s1400_1430)
    (available christine s1430_1500)
    (available christine s1500_1530)
    (available christine s1530_1600)
    (available christine s1600_1630)
    (available christine s1630_1700)

    (available alexander s1100_1130)
    (available alexander s1130_1200)
    (available alexander s1230_1300)
    (available alexander s1300_1330)
    (available alexander s1500_1530)
    (available alexander s1600_1630)

    (all-required-available s1230_1300)
    (all-required-available s1300_1330)
  )
  (:goal (and
    (scheduled s1230_1300)
  ))
)