(define (problem trip_planning_example_17_problem)
  (:domain trip_planning_example_17)
  (:objects
    copenhagen vienna lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    n0 n1 n2 n3 n4 n5 - count
  )
  (:init
    (at_city copenhagen)
    (current_day d1)
    (city_count copenhagen n0)
    (city_count vienna n0)
    (city_count lyon n0)

    ;; Day progression
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
    (next_day d11 d12)

    ;; Count progression
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)

    ;; Flight routes
    (flight copenhagen vienna)
    (flight vienna copenhagen)
    (flight vienna lyon)
    (flight lyon vienna)

    ;; Conference and stay constraints
    ;; Day 1: Conference in Copenhagen
    (can_visit copenhagen d1)

    ;; Day 5: Conference in Copenhagen
    (can_visit copenhagen d5)

    ;; Days without city-specific restrictions
    (can_visit copenhagen d2) (can_visit vienna d2) (can_visit lyon d2)
    (can_visit copenhagen d3) (can_visit vienna d3) (can_visit lyon d3)
    (can_visit copenhagen d4) (can_visit vienna d4) (can_visit lyon d4)
    (can_visit copenhagen d6) (can_visit vienna d6) (can_visit lyon d6)
    (can_visit copenhagen d7) (can_visit vienna d7) (can_visit lyon d7)
    (can_visit copenhagen d8) (can_visit vienna d8) (can_visit lyon d8)
    (can_visit copenhagen d9) (can_visit vienna d9) (can_visit lyon d9)
    (can_visit copenhagen d10) (can_visit vienna d10) (can_visit lyon d10)
    (can_visit copenhagen d11) (can_visit vienna d11) (can_visit lyon d11)
  )
  (:goal
    (and
      (current_day d12)
      (city_count copenhagen n5)
      (city_count vienna n4)
      (city_count lyon n4)
    )
  )
)