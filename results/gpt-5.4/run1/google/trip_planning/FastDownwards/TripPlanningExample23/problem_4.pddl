(define (problem tripplanningexample23_problem)
  (:domain tripplanningexample23)

  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (workshop_window day5)
    (workshop_window day6)
    (workshop_window day7)
    (workshop_window day8)

    (current_day day1)
  )

  (:goal
    (and
      (visited_on day1 london)
      (visited_on day2 london)
      (visited_on day3 london)

      (visited_on day4 bucharest)
      (visited_on day5 bucharest)
      (visited_on day6 bucharest)

      (visited_on day5 riga)
      (visited_on day6 riga)
      (visited_on day7 riga)
      (visited_on day8 riga)

      (or
        (workshop_attended day5)
        (workshop_attended day6)
        (workshop_attended day7)
        (workshop_attended day8))
    )
  )
)