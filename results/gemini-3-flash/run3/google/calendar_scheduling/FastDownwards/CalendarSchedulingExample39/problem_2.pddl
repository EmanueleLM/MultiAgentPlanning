(define (problem calendar_scheduling_example_39)
  (:domain calendar_scheduling)
  
  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Initial time pointer at the start of work hours
    (at_slot s0900)

    ;; Temporal adjacency constraints representing half-hour intervals
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

    ;; Combined availability for Emily, Victoria, and Nancy
    ;; Emily: Free entire day.
    ;; Victoria Busy: 13:30-14:00 (s1330), 14:30-15:30 (s1430, s1500), 16:30-17:00 (s1630).
    ;; Nancy Busy: 09:00-14:00 (s0900 to s1330), 14:30-15:30 (s1430, s1500).
    
    ;; Group is available ONLY when ALL participants are free.
    ;; 09:00 to 14:00: Nancy busy (s0900, s0930, s1000, s1030, s1100, s1130, s1200, s1230, s1300, s1330).
    ;; 14:00: Everyone free.
    (available s1400)
    ;; 14:30 to 15:30: Victoria and Nancy busy (s1430, s1500).
    ;; 15:30: Everyone free.
    (available s1530)
    ;; 16:00: Everyone free.
    (available s1600)
    ;; 16:30: Victoria busy (s1630).
  )

  (:goal
    (meeting_scheduled)
  )
)