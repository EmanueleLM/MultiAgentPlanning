(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    brittany emily doris - agent
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230
    s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ;; Emily is free all day (09:00-17:00) in 30-min granularity
    (free emily s0900) (free emily s0930) (free emily s1000) (free emily s1030)
    (free emily s1100) (free emily s1130) (free emily s1200) (free emily s1230)
    (free emily s1300) (free emily s1330) (free emily s1400) (free emily s1430)
    (free emily s1500) (free emily s1530) (free emily s1600) (free emily s1630)

    ;; Brittany: busy 13:00-13:30 (s1300) and 16:00-16:30 (s1600)
    ;; so free at all other work slots
    (free brittany s0900) (free brittany s0930) (free brittany s1000) (free brittany s1030)
    (free brittany s1100) (free brittany s1130) (free brittany s1200) (free brittany s1230)
    ;; (not free at s1300)
    (free brittany s1330) (free brittany s1400) (free brittany s1430)
    (free brittany s1500) (free brittany s1530)
    ;; (not free at s1600)
    (free brittany s1630)

    ;; Doris: busy 09:00-11:00 (s0900,s0930,s1000,s1030),
    ;; busy 11:30-14:30 (s1130,s1200,s1230,s1300,s1330,s1400),
    ;; busy 15:00-17:00 (s1500,s1530,s1600,s1630)
    ;; Thus Doris is free only at s1100 (11:00-11:30) and s1430 (14:30-15:00)
    (free doris s1100)
    (free doris s1430)
  )

  ;; Goal: schedule the 30-minute meeting at the earliest possible time when all three are available.
  ;; Given the private availabilities, the earliest common free slot is 11:00 (s1100).
  (:goal (meeting-at s1100))
)