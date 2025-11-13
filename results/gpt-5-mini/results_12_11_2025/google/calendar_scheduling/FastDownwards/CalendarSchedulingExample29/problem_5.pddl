(define (problem calendar-scheduling-problem)
  (:domain calendar-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; consecutive 30-minute slots within 09:00-17:00 (only adjacency facts; slots are explicit)
    (next s0900 s0930) (next s0930 s1000) (next s1000 s1030)
    (next s1030 s1100) (next s1100 s1130) (next s1130 s1200)
    (next s1200 s1230) (next s1230 s1300) (next s1300 s1330)
    (next s1330 s1400) (next s1400 s1430) (next s1430 s1500)
    (next s1500 s1530) (next s1530 s1600) (next s1600 s1630)

    ;; encode busy slots (only busy facts are enumerated; free is implicit via absence of busy)
    ;; Madison busy: 09:30-10:00 (s0930), 11:30-12:00 (s1130)
    (busy madison s0930) (busy madison s1130)

    ;; Diana busy: 11:00-11:30 (s1100), 13:00-13:30 (s1300)
    (busy diana s1100) (busy diana s1300)

    ;; Shirley busy: 09:00-12:00 (s0900,s0930,s1000,s1030,s1100,s1130),
    ;; 13:30-15:00 (s1330,s1400,s1430), 15:30-17:00 (s1530,s1600,s1630)
    (busy shirley s0900) (busy shirley s0930) (busy shirley s1000)
    (busy shirley s1030) (busy shirley s1100) (busy shirley s1130)
    (busy shirley s1330) (busy shirley s1400) (busy shirley s1430)
    (busy shirley s1530) (busy shirley s1600) (busy shirley s1630)
  )

  (:goal (meeting_scheduled))
)