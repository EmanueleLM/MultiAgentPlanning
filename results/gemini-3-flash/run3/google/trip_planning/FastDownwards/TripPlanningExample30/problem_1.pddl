(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 - step_count
  )
  (:init
    ;; Starting state: first day, no days spent yet.
    ;; Show requirement implies starting in Zurich or flying there on Day 1.
    (at zurich)
    (current_day d1)
    (count_istanbul n0)
    (count_tallinn n0)
    (count_zurich n0)

    ;; Temporal ordering
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15)

    ;; Count increments
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10) (next_count n10 n11) (next_count n11 n12)
    (next_count n12 n13) (next_count n13 n14)

    ;; Show constraints: Days 1 to 7 are Zurich-only.
    (is_show_day d1) (is_show_day d2) (is_show_day d3) (is_show_day d4)
    (is_show_day d5) (is_show_day d6) (is_show_day d7)

    ;; Non-show days: Days 8 to 14.
    (is_not_show_day d8) (is_not_show_day d9) (is_not_show_day d10)
    (is_not_show_day d11) (is_not_show_day d12) (is_not_show_day d13)
    (is_not_show_day d14)

    ;; Direct flights connectivity
    (conn istanbul tallinn) (conn tallinn istanbul)
    (conn istanbul zurich) (conn zurich istanbul)
    (conn tallinn zurich) (conn zurich tallinn)
  )
  (:goal
    (and
      ;; Total trip duration of 14 days (reaches d15)
      (current_day d15)
      ;; Specific stay requirements (Note: these sum to 16, which may be unreachable in 14 days)
      (count_istanbul n5)
      (count_tallinn n4)
      (count_zurich n7)
    )
  )
)