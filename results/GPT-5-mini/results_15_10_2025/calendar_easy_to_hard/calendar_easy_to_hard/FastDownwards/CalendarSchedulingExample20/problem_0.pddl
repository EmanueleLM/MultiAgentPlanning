(define (problem schedule-monday-30)
  (:domain meeting-scheduling)

  (:objects
    Stephen Elijah William Jeremy Timothy - agent

    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ; Work-time start slots (30-min increments from 09:00 up to 16:30)
    (work-time t0900) (work-time t0930) (work-time t1000) (work-time t1030)
    (work-time t1100) (work-time t1130) (work-time t1200) (work-time t1230)
    (work-time t1300) (work-time t1330) (work-time t1400) (work-time t1430)
    (work-time t1500) (work-time t1530) (work-time t1600) (work-time t1630)

    ; --- Busy intervals interpreted as unavailable start times (private constraints) ---
    ; Elijah: busy 09:00-09:30, 12:30-13:00, 14:30-15:00, 16:00-16:30
    (busy Elijah t0900)
    (busy Elijah t1230)
    (busy Elijah t1430)
    (busy Elijah t1600)

    ; William: busy 09:30-10:00, 15:30-16:00
    (busy William t0930)
    (busy William t1530)

    ; Jeremy: busy 09:00-09:30, 10:00-12:00, 13:00-15:00, 15:30-17:00
    ; 10:00-12:00 blocks starts at 10:00,10:30,11:00,11:30
    ; 13:00-15:00 blocks starts at 13:00,13:30,14:00,14:30
    ; 15:30-17:00 blocks starts at 15:30,16:00,16:30
    (busy Jeremy t0900)
    (busy Jeremy t1000) (busy Jeremy t1030) (busy Jeremy t1100) (busy Jeremy t1130)
    (busy Jeremy t1300) (busy Jeremy t1330) (busy Jeremy t1400) (busy Jeremy t1430)
    (busy Jeremy t1530) (busy Jeremy t1600) (busy Jeremy t1630)

    ; Timothy: busy 10:00-10:30, 11:30-14:30, 15:30-16:00
    ; 11:30-14:30 blocks starts at 11:30,12:00,12:30,13:00,13:30,14:00
    (busy Timothy t1000)
    (busy Timothy t1130) (busy Timothy t1200) (busy Timothy t1230)
    (busy Timothy t1300) (busy Timothy t1330) (busy Timothy t1400)
    (busy Timothy t1530)

    ; Stephen: "I am free the entire day on Monday." => no busy facts for Stephen

    ; --- Explicit free facts (every agent/time except the busy ones above) ---
    ; Stephen: free all work-time start slots
    (free Stephen t0900) (free Stephen t0930) (free Stephen t1000) (free Stephen t1030)
    (free Stephen t1100) (free Stephen t1130) (free Stephen t1200) (free Stephen t1230)
    (free Stephen t1300) (free Stephen t1330) (free Stephen t1400) (free Stephen t1430)
    (free Stephen t1500) (free Stephen t1530) (free Stephen t1600) (free Stephen t1630)

    ; Elijah: free at all work times except his busy ones (t0900, t1230, t1430, t1600)
    (free Elijah t0930) (free Elijah t1000) (free Elijah t1030) (free Elijah t1100)
    (free Elijah t1130) (free Elijah t1200) (free Elijah t1300) (free Elijah t1330)
    (free Elijah t1400) (free Elijah t1500) (free Elijah t1530) (free Elijah t1630)

    ; William: free at all work times except t0930 and t1530
    (free William t0900) (free William t1000) (free William t1030) (free William t1100)
    (free William t1130) (free William t1200) (free William t1230) (free William t1300)
    (free William t1330) (free William t1400) (free William t1430) (free William t1500)
    (free William t1600) (free William t1630)

    ; Jeremy: free only at the start times that do not overlap any of his busy intervals
    ; (From the busy intervals above, the remaining free starts are: 09:30, 12:00, 12:30, 15:00)
    (free Jeremy t0930) (free Jeremy t1200) (free Jeremy t1230) (free Jeremy t1500)

    ; Timothy: free at all work times except t1000, t1130, t1200, t1230, t1300, t1330, t1400, t1530
    (free Timothy t0900) (free Timothy t0930) (free Timothy t1030) (free Timothy t1100)
    (free Timothy t1430) (free Timothy t1500) (free Timothy t1600) (free Timothy t1630)
  )

  ; Goal: schedule a 30-minute meeting (one start time) that all five participants attend.
  ; Per the instruction to prefer the earliest feasible slot, the earliest slot that satisfies all
  ; hard constraints (computed from the busy intervals above) is 15:00 (t1500). We set the goal accordingly.
  (:goal (and
    (scheduled t1500)
    (attending Stephen t1500)
    (attending Elijah t1500)
    (attending William t1500)
    (attending Jeremy t1500)
    (attending Timothy t1500)
  ))
)