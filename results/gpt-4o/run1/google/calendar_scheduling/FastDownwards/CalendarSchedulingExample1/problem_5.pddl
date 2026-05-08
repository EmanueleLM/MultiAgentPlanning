(define (problem schedule_meeting_example)
  (:domain calendar_scheduling_example)

  (:objects
    raymond billy donald - participant
    slot_0930 slot_1000 slot_1030 slot_1100
    slot_1130 slot_1200 slot_1230 slot_1300
    slot_1330 slot_1400 slot_1430 slot_1500
    slot_1530 slot_1600 slot_1630 slot_1700 - time_slot
  )

  (:init
    (consecutive slot_0930 slot_1000)
    (consecutive slot_1000 slot_1030)
    (consecutive slot_1030 slot_1100)
    (consecutive slot_1100 slot_1130)
    (consecutive slot_1130 slot_1200)
    (consecutive slot_1200 slot_1230)
    (consecutive slot_1230 slot_1300)
    (consecutive slot_1300 slot_1330)
    (consecutive slot_1330 slot_1400)
    (consecutive slot_1400 slot_1430)
    (consecutive slot_1430 slot_1500)
    (consecutive slot_1500 slot_1530)
    (consecutive slot_1530 slot_1600)
    (consecutive slot_1600 slot_1630)
    (consecutive slot_1630 slot_1700)

    ; Raymond's available schedule:
    (available raymond slot_1000)
    (available raymond slot_1030)
    (available raymond slot_1100)
    (available raymond slot_1200)
    (available raymond slot_1230)
    (available raymond slot_1300)
    (available raymond slot_1330)
    (available raymond slot_1400)
    (available raymond slot_1430)
    (available raymond slot_1500)
    (available raymond slot_1530)
    (available raymond slot_1600)
    (available raymond slot_1630)
    (available raymond slot_1700)

    ; Billy's available schedule:
    (available billy slot_0930)
    (available billy slot_1030)
    (available billy slot_1100)
    (available billy slot_1130)
    (available billy slot_1300)
    (available billy slot_1330)
    (available billy slot_1400)
    (available billy slot_1430)
    (available billy slot_1500)

    ; Donald's available schedule:
    (available donald slot_0930)
    (available donald slot_1100)
    (available donald slot_1130)
    (available donald slot_1300)
    (available donald slot_1330)
    (available donald slot_1400)
    (available donald slot_1430)
    (available donald slot_1500)
    (available donald slot_1530)

    ; Billy's preferred times to avoid:
    (preferred billy slot_1530)
    (preferred billy slot_1600)
    (preferred billy slot_1630)
    (preferred billy slot_1700)
  )

  (:goal
    (meeting_scheduled)
  )
)