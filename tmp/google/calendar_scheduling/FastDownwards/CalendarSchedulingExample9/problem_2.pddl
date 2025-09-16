(define (problem meeting-3way)
  (:domain calendar-meeting)
  (:objects diane kelly deborah - person
            slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
            slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
            slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
            slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - slot)
  (:init
     (busy diane slot_0900_0930)
     (busy diane slot_1200_1230)
     (busy diane slot_1430_1500)
     (busy diane slot_1500_1530)

     (busy deborah slot_0900_0930)
     (busy deborah slot_1000_1030)
     (busy deborah slot_1030_1100)
     (busy deborah slot_1100_1130)
     (busy deborah slot_1130_1200)
     (busy deborah slot_1200_1230)
     (busy deborah slot_1230_1300)
     (busy deborah slot_1300_1330)
     (busy deborah slot_1330_1400)
     (busy deborah slot_1430_1500)
     (busy deborah slot_1500_1530)
     (busy deborah slot_1530_1600)
     (busy deborah slot_1600_1630)
     (busy deborah slot_1630_1700)

     (busy kelly slot_0930_1000)
     (busy kelly slot_1030_1100)
  )
  (:goal (scheduled slot_1400_1430))
)