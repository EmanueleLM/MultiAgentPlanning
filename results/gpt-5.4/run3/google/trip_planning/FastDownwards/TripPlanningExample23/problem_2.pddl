(define (problem tripplanningexample23_problem)
  (:domain tripplanningexample23)

  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (at london)

    (current_day day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (direct london bucharest)
    (direct bucharest london)
    (direct bucharest riga)
    (direct riga bucharest)

    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)
  )

  (:goal
    (and
      (current_day day9)

      (visited_on london day1)
      (visited_on london day2)
      (visited_on london day3)

      (visited_on bucharest day4)
      (visited_on bucharest day5)
      (visited_on bucharest day6)

      (visited_on riga day5)
      (visited_on riga day6)
      (visited_on riga day7)
      (visited_on riga day8)

      (or
        (workshop_attended_on day5)
        (workshop_attended_on day6)
        (workshop_attended_on day7)
        (workshop_attended_on day8)
      )
    )
  )
)