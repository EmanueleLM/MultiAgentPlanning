(define (problem monday_meeting_adam_jerry_matthew_half_hour)
  (:domain monday_meeting_scheduling)

  (:objects
    slot_0900 slot_0930 slot_1000 slot_1030
    slot_1100 slot_1130 slot_1200 slot_1230
    slot_1300 slot_1330 slot_1400 slot_1430
    slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )

  (:init
    (unscheduled)

    (busy adam slot_1000)
    (busy adam slot_1230)
    (busy adam slot_1330)
    (busy adam slot_1400)

    (busy jerry slot_0900)
    (busy jerry slot_1200)
    (busy jerry slot_1500)
    (busy jerry slot_1530)

    (busy matthew slot_0930)
    (busy matthew slot_1000)
    (busy matthew slot_1030)
    (busy matthew slot_1130)
    (busy matthew slot_1200)
    (busy matthew slot_1300)
    (busy matthew slot_1330)
    (busy matthew slot_1430)
    (busy matthew slot_1500)
    (busy matthew slot_1530)
    (busy matthew slot_1600)
    (busy matthew slot_1630)
  )

  (:goal
    (scheduled)
  )
)