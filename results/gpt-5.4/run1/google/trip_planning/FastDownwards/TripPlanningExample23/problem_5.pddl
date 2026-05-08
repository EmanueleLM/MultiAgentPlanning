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

    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)

    (current day1)
  )

  (:goal
    (and
      (current day8)

      (occupies london day1)
      (occupies london day2)
      (occupies london day3)

      (occupies bucharest day4)
      (occupies bucharest day5)
      (occupies bucharest day6)

      (occupies riga day5)
      (occupies riga day6)
      (occupies riga day7)
      (occupies riga day8)

      (workshop_attended)
    )
  )
)