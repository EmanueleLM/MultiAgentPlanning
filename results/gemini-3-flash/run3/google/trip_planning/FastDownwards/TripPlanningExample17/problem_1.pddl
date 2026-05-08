(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    copenhagen vienna lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    ;; Starting location and time
    (at_city copenhagen)
    (current_day d1)

    ;; Stay counters for each city
    (stay_count copenhagen n0)
    (stay_count vienna n0)
    (stay_count lyon n0)

    ;; Day sequence (11 days total)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)

    ;; Counting sequence (up to 5 for Copenhagen)
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)

    ;; Flight connectivity
    (adjacent copenhagen vienna)
    (adjacent vienna copenhagen)
    (adjacent vienna lyon)
    (adjacent lyon vienna)
  )
  (:goal
    (and
      ;; Stay requirements
      (stay_count copenhagen n5)
      (stay_count vienna n4)
      (stay_count lyon n4)

      ;; Conference constraints
      (visited copenhagen d1)
      (visited copenhagen d5)

      ;; Ensure we use all 11 days (the trip reaches the 11th day)
      (current_day d11)
    )
  )
)