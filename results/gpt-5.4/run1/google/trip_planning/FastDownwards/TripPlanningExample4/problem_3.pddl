(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    seville munich tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    (current_day day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)

    (direct seville munich)
    (direct munich seville)
    (direct munich tallinn)
    (direct tallinn munich)

    (friend_window day11)
    (friend_window day12)
  )

  (:goal
    (and
      (met_friend)

      (visited seville day1)
      (visited seville day2)
      (visited seville day3)
      (visited seville day4)
      (visited seville day5)
      (visited seville day6)
      (visited seville day7)

      (visited munich day8)
      (visited munich day9)
      (visited munich day10)

      (visited tallinn day11)
      (visited tallinn day12)
    )
  )
)