(define (problem trip_planning_example49_problem)
  (:domain trip_planning_example49)

  (:objects
    reykjavik milan split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )

  (:init
    (at split)

    (direct milan reykjavik)
    (direct reykjavik milan)
    (direct split milan)
    (direct milan split)

    (current_day d1)

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
    (next_day d12 d13)
    (next_day d13 d14)
  )

  (:goal
    (and
      (current_day d14)
      (visited_split_within_window)

      (spent d1 split)
      (spent d2 split)
      (spent d3 split)

      (spent d4 milan)
      (spent d5 milan)
      (spent d6 milan)
      (spent d7 milan)
      (spent d8 milan)
      (spent d9 milan)
      (spent d10 milan)

      (spent d11 reykjavik)
      (spent d12 reykjavik)
      (spent d13 reykjavik)
    )
  )
)