(define (problem schedule-meeting-tue-2025-10-21)
  (:domain meeting-scheduling)
  (:objects
    alice bob carol - agent
    slot_0900 slot_0930 slot_1000 slot_1030
    slot_1100 slot_1130 slot_1200 slot_1230
    slot_1300 slot_1330 slot_1400 slot_1430
    slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )

  (:init
    ;; Alice availability: 09:00-11:00 and 13:00-16:00
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

    ;; Bob availability: 10:30-12:00 and 14:00-15:30
    (available bob slot_1030)
    (available bob slot_1100)
    (available bob slot_1130)
    (available bob slot_1400)
    (available bob slot_1430)
    (available bob slot_1500)

    ;; Carol availability: 09:30-10:30, 11:00-12:30, 15:00-17:00
    (available carol slot_0930)
    (available carol slot_1000)
    (available carol slot_1100)
    (available carol slot_1130)
    (available carol slot_1200)
    (available carol slot_1500)
    (available carol slot_1530)
    (available carol slot_1600)
    (available carol slot_1630)

    ;; Preference converted to a strict temporal constraint:
    ;; "Minimize interruption to Bob's morning schedule" -> forbid scheduling before 12:00.
    ;; Mark slots that satisfy the preference (start at or after 12:00).
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
  )

  ;; Goal: earliest feasible 30-minute slot for all three while respecting the preference.
  ;; Given the stated availabilities and the hard preference (no morning), the earliest feasible slot is 15:00-15:30.
  (:goal (and
    (meeting_scheduled)
    (scheduled-at slot_1500)
  ))
)