(define (problem trip_planning_example14_problem)
  (:domain trip_planning_example14)

  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (direct lyon frankfurt)
    (direct frankfurt lyon)
    (direct frankfurt krakow)
    (direct krakow frankfurt)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (current_day d1)
    (at lyon)

    (show_day d8)
    (show_day d9)
    (show_day d10)

    (goal_day_city d1 lyon)
    (goal_day_city d2 lyon)
    (goal_day_city d3 lyon)
    (goal_day_city d4 lyon)
    (goal_day_city d5 lyon)
    (goal_day_city d6 frankfurt)
    (goal_day_city d7 frankfurt)
    (goal_day_city d8 krakow)
    (goal_day_city d9 krakow)
    (goal_day_city d10 krakow)

    (last_day d10)
    (required_final krakow)
  )

  (:goal
    (and
      (trip_finished)
      (occupied d1 lyon)
      (occupied d2 lyon)
      (occupied d3 lyon)
      (occupied d4 lyon)
      (occupied d5 lyon)
      (occupied d6 frankfurt)
      (occupied d7 frankfurt)
      (occupied d8 krakow)
      (occupied d9 krakow)
      (occupied d10 krakow)
      (at krakow)
    )
  )
)