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

    (workshop_window day5)
    (workshop_window day6)
    (workshop_window day7)
    (workshop_window day8)
  )

  (:goal
    (and
      (current_day day9)
      (spent london day1)
      (spent london day2)
      (spent london day3)
      (spent bucharest day4)
      (spent bucharest day5)
      (spent bucharest day6)
      (spent riga day5)
      (spent riga day6)
      (spent riga day7)
      (spent riga day8)
      (workshop_attended)
    )
  )
)