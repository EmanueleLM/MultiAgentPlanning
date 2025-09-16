(define (problem monday-coordinated-meeting)
  (:domain coordinated-meeting-scheduler)
  (:objects
    m1 - meeting
  )
  (:init
    ; Agent 1: m1 not yet scheduled
    (not (scheduled-agt1 m1))

    ; Agent 2: all 60-minute blocks (two consecutive 30-min slots) are initially free
    (free-slot-agt2 t0900) (free-slot-agt2 t0930) (free-slot-agt2 t1000) (free-slot-agt2 t1030)
    (free-slot-agt2 t1100) (free-slot-agt2 t1130) (free-slot-agt2 t1200) (free-slot-agt2 t1230)
    (free-slot-agt2 t1300) (free-slot-agt2 t1330) (free-slot-agt2 t1400) (free-slot-agt2 t1430)
    (free-slot-agt2 t1500) (free-slot-agt2 t1530) (free-slot-agt2 t1600) (free-slot-agt2 t1630)

    ; Agent 3: Kevin's busy times (true means busy). He is busy at all times except 15:30 (t1530) and, to satisfy the 60-min window, t1600 should be free as well.
    (busy-kevin-agt3 kevin t0900)
    (busy-kevin-agt3 kevin t0930)
    (busy-kevin-agt3 kevin t1000)
    (busy-kevin-agt3 kevin t1030)
    (busy-kevin-agt3 kevin t1100)
    (busy-kevin-agt3 kevin t1130)
    (busy-kevin-agt3 kevin t1200)
    (busy-kevin-agt3 kevin t1230)
    (busy-kevin-agt3 kevin t1300)
    (busy-kevin-agt3 kevin t1330)
    (busy-kevin-agt3 kevin t1400)
    (busy-kevin-agt3 kevin t1430)
    (busy-kevin-agt3 kevin t1500)
    ; Note: t1530 and t1600 are left unspecified (treated as not busy for Kevin)
    (busy-kevin-agt3 kevin t1630)

    ; Define the time-slot chain for Agent 3: 09:00 -> 09:30 -> 10:00 -> ... -> 16:30
    (next-slot-agt3 t0900 t0930)
    (next-slot-agt3 t0930 t1000)
    (next-slot-agt3 t1000 t1030)
    (next-slot-agt3 t1030 t1100)
    (next-slot-agt3 t1100 t1130)
    (next-slot-agt3 t1130 t1200)
    (next-slot-agt3 t1200 t1230)
    (next-slot-agt3 t1230 t1300)
    (next-slot-agt3 t1300 t1330)
    (next-slot-agt3 t1330 t1400)
    (next-slot-agt3 t1400 t1430)
    (next-slot-agt3 t1430 t1500)
    (next-slot-agt3 t1500 t1530)
    (next-slot-agt3 t1530 t1600)
    (next-slot-agt3 t1600 t1630)
  )
  (:goal
    (and
      ; All three agents agree on the same 60-minute window starting at 15:30
      (scheduled-agt1 m1)
      (start-agt1 m1 t1530)
      (meeting-at-agt2 t1530)
      (meeting_at-agt3 t1530)
    )
  )
)