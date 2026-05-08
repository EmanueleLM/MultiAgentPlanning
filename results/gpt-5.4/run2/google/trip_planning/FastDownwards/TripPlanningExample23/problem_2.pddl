(define (problem tripplanningexample23_problem)
  (:domain tripplanningexample23)

  (:objects
    london bucharest riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (at london)
    (current day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (required london day_1)
    (required london day_2)
    (required london day_3)

    (required bucharest day_4)
    (required bucharest day_5)
    (required bucharest day_6)

    (required riga day_7)
    (required riga day_8)

    (required riga day_5)
    (required riga day_6)
    (required riga day_7)
    (required riga day_8)
  )

  (:goal
    (and
      (current day_9)
      (visited_day day_1 london)
      (visited_day day_2 london)
      (visited_day day_3 london)
      (visited_day day_4 bucharest)
      (visited_day day_5 bucharest)
      (visited_day day_6 bucharest)
      (visited_day day_5 riga)
      (visited_day day_6 riga)
      (visited_day day_7 riga)
      (visited_day day_8 riga)
    )
  )
)