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

      (in_city_on london day1)
      (in_city_on london day2)
      (in_city_on london day3)

      (in_city_on bucharest day4)
      (in_city_on bucharest day5)
      (in_city_on bucharest day6)

      (in_city_on riga day5)
      (in_city_on riga day6)
      (in_city_on riga day7)
      (in_city_on riga day8)

      (workshop_attended)
    )
  )
)