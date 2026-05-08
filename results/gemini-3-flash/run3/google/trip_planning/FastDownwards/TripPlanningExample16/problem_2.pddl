(define (problem trip_planning_example_16_problem)
  (:domain trip_planning_example_16)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    ;; Starting location and day
    (at prague d1)
    (visited prague d1)

    ;; Initial stay counts (Prague starts with 1 for day 1; others start at 0)
    (city_count prague c1)
    (city_count vienna c0)
    (city_count porto c0)

    ;; Temporal adjacency
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Counter adjacency
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)

    ;; Direct flight connections
    (flight vienna porto)
    (flight porto vienna)
    (flight prague vienna)
    (flight vienna prague)
  )

  (:goal
    (and
      ;; Hard constraint: Workshop in Prague between day 1 and day 3 (inclusive)
      (visited prague d1)
      (visited prague d2)
      (visited prague d3)

      ;; City stay duration requirements
      (city_count prague c3)
      (city_count vienna c3)
      (city_count porto c5)
    )
  )
)