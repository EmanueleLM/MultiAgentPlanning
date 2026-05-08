(define (problem tripplanningexample23_problem)
  (:domain tripplanningexample23)

  (:objects
    london bucharest riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (workshop_window day_5)
    (workshop_window day_6)
    (workshop_window day_7)
    (workshop_window day_8)

    (current_day day_1)
  )

  (:goal
    (and
      (visited_on day_1 london)
      (visited_on day_2 london)
      (visited_on day_3 london)

      (visited_on day_4 bucharest)
      (visited_on day_5 bucharest)
      (visited_on day_6 bucharest)

      (visited_on day_5 riga)
      (visited_on day_6 riga)
      (visited_on day_7 riga)
      (visited_on day_8 riga)

      (attended_workshop)
    )
  )
)