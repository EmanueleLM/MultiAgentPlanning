(define (problem tripplanningexample23_problem)
  (:domain tripplanningexample23)

  (:objects
    london bucharest riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (at london)

    (current_day day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)

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
      (workshop_attended)

      (in_london_day day1)
      (in_london_day day2)
      (in_london_day day3)

      (in_bucharest_day day4)
      (in_bucharest_day day5)
      (in_bucharest_day day6)

      (in_riga_day day5)
      (in_riga_day day6)
      (in_riga_day day7)
      (in_riga_day day8)
    )
  )
)