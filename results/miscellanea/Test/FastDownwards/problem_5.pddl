(define (problem schedule-meeting-tue-2025-10-21)
  (:domain meeting-scheduling)
  (:objects
    slot_0900 slot_0930 slot_1000 slot_1030
    slot_1100 slot_1130 slot_1200 slot_1230
    slot_1300 slot_1330 slot_1400 slot_1430
    slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )

  (:init
    (available alice slot_0900)
    (available alice slot_0930)
    (available alice slot_1000)
    (available alice slot_1030)
    (available alice slot_1300)
    (available alice slot_1330)
    (available alice slot_1400)
    (available alice slot_1430)
    (available alice slot_1500)
    (available alice slot_1530)

    (available bob slot_1030)
    (available bob slot_1100)
    (available bob slot_1130)
    (available bob slot_1400)
    (available bob slot_1430)
    (available bob slot_1500)

    (available carol slot_0930)
    (available carol slot_1000)
    (available carol slot_1100)
    (available carol slot_1130)
    (available carol slot_1200)
    (available carol slot_1500)
    (available carol slot_1530)
    (available carol slot_1600)
    (available carol slot_1630)

    (allowed-by-pref slot_1200)
    (allowed-by-pref slot_1230)
    (allowed-by-pref slot_1300)
    (allowed-by-pref slot_1330)
    (allowed-by-pref slot_1400)
    (allowed-by-pref slot_1430)
    (allowed-by-pref slot_1500)
    (allowed-by-pref slot_1530)
    (allowed-by-pref slot_1600)
    (allowed-by-pref slot_1630)

    (earliest-slot slot_1500)
  )

  (:goal (and
    (meeting_scheduled)
    (scheduled-at slot_1500)
  ))
)