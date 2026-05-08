(define (problem tripplanningexample47)
  (:domain european_trip_7_days)

  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )

  (:init
    (at paris)
    (visited paris)

    (direct paris istanbul)
    (direct istanbul paris)
    (direct istanbul salzburg)
    (direct salzburg istanbul)

    (current_day day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (last_day day7)
  )

  (:goal
    (and
      (trip_complete)

      (spent day1)
      (spent day2)
      (spent day3)
      (spent day4)
      (spent day5)
      (spent day6)
      (spent day7)

      (spent_in day1 paris)
      (spent_in day2 paris)

      (spent_in day3 istanbul)
      (spent_in day4 istanbul)

      (spent_in day5 salzburg)
      (spent_in day6 salzburg)
      (spent_in day7 salzburg)

      (visited paris)
      (visited istanbul)
      (visited salzburg)
    )
  )
)