(define (problem trip_planning_example_16_problem)
  (:domain trip_planning_example_16)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    c0 c1 c2 c3 c4 c5 - count
  )

  (:init
    ;; Starting location: Prague on Day 1
    (at prague d1)
    (visited prague d1)

    ;; Initial visit counts for all cities
    (visit_count prague c0)
    (visit_count vienna c0)
    (visit_count porto c0)

    ;; Temporal succession (9 days)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    ;; Stay duration counter progression (up to 5 days)
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)

    ;; Direct flight network
    (flight prague vienna)
    (flight vienna prague)
    (flight vienna porto)
    (flight porto vienna)
  )

  (:goal
    (and
      ;; Mandatory Workshop in Prague: Day 1 to Day 3
      (visited prague d1)
      (visited prague d2)
      (visited prague d3)

      ;; Exact stay duration requirements for each city
      (visit_count prague c3)
      (visit_count vienna c3)
      (visit_count porto c5)
    )
  )
)