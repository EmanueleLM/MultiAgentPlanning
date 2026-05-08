(define (problem trip_planning_34)
  (:domain trip_planning)
  (:objects
    frankfurt florence valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )
  (:init
    ;; Calendar day sequence (9 days total)
    (day_adj d1 d2) (day_adj d2 d3) (day_adj d3 d4) (day_adj d4 d5)
    (day_adj d5 d6) (day_adj d6 d7) (day_adj d7 d8) (day_adj d8 d9)

    ;; Counting sequence (up to 5 days required)
    (count_adj c0 c1) (count_adj c1 c2) (count_adj c2 c3) (count_adj c3 c4) (count_adj c4 c5)

    ;; Direct flight network
    (flight frankfurt florence)
    (flight florence frankfurt)
    (flight valencia frankfurt)
    (flight frankfurt valencia)

    ;; Initial state: Starting in Valencia on Day 1
    (at valencia d1)
    (stay_count valencia c0)
    (stay_count frankfurt c0)
    (stay_count florence c0)
  )
  (:goal
    (and
      ;; Required stay durations in each city
      (stay_count valencia c2)
      (stay_count frankfurt c5)
      (stay_count florence c4)

      ;; Temporal constraints: Visit relatives in Valencia on Day 1 and Day 2
      (visited valencia d1)
      (visited valencia d2)
    )
  )
)