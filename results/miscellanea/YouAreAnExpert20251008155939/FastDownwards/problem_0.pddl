(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    michelle steven jerry - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; adjacency for 30-minute granularity (09:00 .. 16:30)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030) (next s1030 s1100)
    (next s1100 s1130) (next s1130 s1200) (next s1200 s1230) (next s1230 s1300)
    (next s1300 s1330) (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; Encode private busy intervals as hard constraints (unavailable slots)
    ;; Michelle: meeting on Monday 11:00-12:00 -> busy at 11:00 and 11:30
    (busy michelle s1100)
    (busy michelle s1130)

    ;; Steven: blocked 09:00-09:30, 11:30-12:00, 13:30-14:00, 15:30-16:00
    (busy steven s0900)
    (busy steven s1130)
    (busy steven s1330)
    (busy steven s1530)

    ;; Jerry: blocked 09:00-09:30, 10:00-11:00, 11:30-12:30, 13:00-14:30, 15:30-16:00, 16:30-17:00
    (busy jerry s0900)
    (busy jerry s1000) (busy jerry s1030)
    (busy jerry s1130) (busy jerry s1200)
    (busy jerry s1300) (busy jerry s1330) (busy jerry s1400)
    (busy jerry s1530)
    (busy jerry s1630)
  )

  ;; Earliest feasible 60-minute (two-slot) meeting given all busy constraints is
  ;; 14:30-15:30, i.e. slots s1430 and s1500. Set the goal to schedule at that earliest slot.
  (:goal (and (scheduled s1430 s1500)))
)