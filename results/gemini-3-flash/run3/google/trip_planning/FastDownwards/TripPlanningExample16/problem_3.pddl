(define (problem trip_planning_example_16_problem)
  (:domain trip_planning_example_16)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    ;; Starting configuration on Day 1
    (at prague d1)
    (city_visited_day prague d1)
    
    ;; Initial stay counts (Prague already has its first day; others start at 0)
    (city_count prague c1)
    (city_count vienna c0)
    (city_count porto c0)

    ;; Temporal sequence
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Stay count progression
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)

    ;; Available direct flight routes
    (flight prague vienna)
    (flight vienna prague)
    (flight vienna porto)
    (flight porto vienna)
  )

  (:goal
    (and
      ;; Workshop in Prague requirement (Days 1, 2, and 3)
      (city_visited_day prague d1)
      (city_visited_day prague d2)
      (city_visited_day prague d3)

      ;; City stay duration requirements (exactly 3, 3, and 5 days)
      (city_count prague c3)
      (city_count vienna c3)
      (city_count porto c5)
    )
  )
)