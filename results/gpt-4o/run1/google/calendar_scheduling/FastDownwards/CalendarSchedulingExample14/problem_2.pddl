(define (problem schedule_meeting_instance)
  (:domain meeting_scheduler)

  (:objects
    brandon jerry bradley - participant
    slot_0900_0930 slot_0930_1000 slot_1000_1030 slot_1030_1100
    slot_1100_1130 slot_1130_1200 slot_1200_1230 slot_1230_1300
    slot_1300_1330 slot_1330_1400 slot_1400_1430 slot_1430_1500
    slot_1500_1530 slot_1530_1600 slot_1600_1630 slot_1630_1700 - time_slot
  )

  (:init
    ; Brandon's availability considering his preference
    (available brandon slot_1430_1500)
    (available brandon slot_1500_1530)

    ; Jerry's full availability
    (available jerry slot_0900_0930)
    (available jerry slot_0930_1000)
    (available jerry slot_1000_1030)
    (available jerry slot_1030_1100)
    (available jerry slot_1100_1130)
    (available jerry slot_1130_1200)
    (available jerry slot_1200_1230)
    (available jerry slot_1230_1300)
    (available jerry slot_1300_1330)
    (available jerry slot_1330_1400)
    (available jerry slot_1400_1430)
    (available jerry slot_1430_1500)
    (available jerry slot_1500_1530)
    (available jerry slot_1530_1600)
    (available jerry slot_1600_1630)
    (available jerry slot_1630_1700)

    ; Bradley’s availability
    (available bradley slot_1530_1600)
    (available bradley slot_1630_1700)
  )

  (:goal
    (exists (?s - time_slot) (meeting_scheduled ?s))
  )
)