(define (problem meeting_scheduling_instance)
  (:domain meeting_scheduling)
  (:objects 
    julie sean lori - participant
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700
    - meeting_slot
  )
  (:init 
    ;; Julie's available slots
    (available julie slot_0930_1000)
    (available julie slot_1000_1030)
    (available julie slot_1030_1100)
    (available julie slot_1130_1200)
    (available julie slot_1200_1230)
    (available julie slot_1230_1300)
    (available julie slot_1300_1330)
    (available julie slot_1400_1430)
    (available julie slot_1430_1500)
    (available julie slot_1500_1530)

    ;; Sean's available slots
    (available sean slot_0930_1000)
    (available sean slot_1000_1030)
    (available sean slot_1030_1100)
    (available sean slot_1100_1130)
    (available sean slot_1130_1200)
    (available sean slot_1200_1230)
    (available sean slot_1230_1300)
    (available sean slot_1330_1400)
    (available sean slot_1400_1430)
    (available sean slot_1430_1500)

    ;; Lori's available slots
    (available lori slot_0900_0930)
    (available lori slot_0930_1000)
    (available lori slot_1300_1330)
    (available lori slot_1330_1400)
    (available lori slot_1400_1430)
    (available lori slot_1430_1500)

    ;; Consecutive slots
    (consecutive slot_0900_0930 slot_0930_1000)
    (consecutive slot_0930_1000 slot_1000_1030)
    (consecutive slot_1000_1030 slot_1030_1100)
    (consecutive slot_1030_1100 slot_1100_1130)
    (consecutive slot_1100_1130 slot_1130_1200)
    (consecutive slot_1130_1200 slot_1200_1230)
    (consecutive slot_1200_1230 slot_1230_1300)
    (consecutive slot_1230_1300 slot_1300_1330)
    (consecutive slot_1300_1330 slot_1330_1400)
    (consecutive slot_1330_1400 slot_1400_1430)
    (consecutive slot_1400_1430 slot_1430_1500)
    (consecutive slot_1430_1500 slot_1500_1530)
    (consecutive slot_1500_1530 slot_1530_1600)
    (consecutive slot_1530_1600 slot_1600_1630)
    (consecutive slot_1600_1630 slot_1630_1700)
  )
  (:goal 
    (exists (?s1 ?s2 - meeting_slot)
      (and 
        (meeting_scheduled ?s1 ?s2)
      )
    )
  )
)