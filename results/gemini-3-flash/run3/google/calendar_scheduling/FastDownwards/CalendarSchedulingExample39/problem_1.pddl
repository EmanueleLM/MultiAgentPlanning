(define (problem calendar_scheduling_example_39)
  (:domain calendar_scheduling)
  
  (:objects
    emily victoria nancy - person
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Starting time pointer
    (at_slot s0900)

    ;; Temporal sequence of slots
    (next_slot s0900 s0930)
    (next_slot s0930 s1000)
    (next_slot s1000 s1030)
    (next_slot s1030 s1100)
    (next_slot s1100 s1130)
    (next_slot s1130 s1200)
    (next_slot s1200 s1230)
    (next_slot s1230 s1300)
    (next_slot s1300 s1330)
    (next_slot s1330 s1400)
    (next_slot s1400 s1430)
    (next_slot s1430 s1500)
    (next_slot s1500 s1530)
    (next_slot s1530 s1600)
    (next_slot s1600 s1630)

    ;; Availability for Emily (Free the entire day)
    (is_available emily s0900)
    (is_available emily s0930)
    (is_available emily s1000)
    (is_available emily s1030)
    (is_available emily s1100)
    (is_available emily s1130)
    (is_available emily s1200)
    (is_available emily s1230)
    (is_available emily s1300)
    (is_available emily s1330)
    (is_available emily s1400)
    (is_available emily s1430)
    (is_available emily s1500)
    (is_available emily s1530)
    (is_available emily s1600)
    (is_available emily s1630)

    ;; Availability for Victoria
    ;; Busy: 13:30-14:00 (s1330), 14:30-15:30 (s1430, s1500), 16:30-17:00 (s1630)
    (is_available victoria s0900)
    (is_available victoria s0930)
    (is_available victoria s1000)
    (is_available victoria s1030)
    (is_available victoria s1100)
    (is_available victoria s1130)
    (is_available victoria s1200)
    (is_available victoria s1230)
    (is_available victoria s1300)
    ;; s1330 busy
    (is_available victoria s1400)
    ;; s1430 busy
    ;; s1500 busy
    (is_available victoria s1530)
    (is_available victoria s1600)
    ;; s1630 busy

    ;; Availability for Nancy
    ;; Busy: 09:00-14:00 (s0900-s1330), 14:30-15:30 (s1430, s1500)
    ;; s0900 to s1330 busy
    (is_available nancy s1400)
    ;; s1430 busy
    ;; s1500 busy
    (is_available nancy s1530)
    (is_available nancy s1600)
    (is_available nancy s1630)
  )

  (:goal
    (meeting_scheduled)
  )
)