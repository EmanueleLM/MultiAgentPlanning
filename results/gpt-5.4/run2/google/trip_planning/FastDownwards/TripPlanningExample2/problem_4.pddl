(define (problem tripplanningexample2_problem)
  (:domain tripplanningexample2)

  (:objects
    reykjavik vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at reykjavik)
    (current_day day1)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)

    (last_day day11)

    (direct reykjavik vienna)
    (direct vienna reykjavik)
    (direct vienna venice)
    (direct venice vienna)

    (required_city day1 reykjavik)
    (required_city day2 reykjavik)

    (required_city day3 vienna)
    (required_city day4 vienna)
    (required_city day5 vienna)
    (required_city day6 vienna)
    (required_city day7 vienna)

    (required_city day8 venice)
    (required_city day9 venice)
    (required_city day10 venice)
    (required_city day11 venice)

    (wedding_window day8)
    (wedding_window day9)
    (wedding_window day10)
    (wedding_window day11)
  )

  (:goal
    (and
      (in_city_on reykjavik day1)
      (in_city_on reykjavik day2)

      (in_city_on vienna day3)
      (in_city_on vienna day4)
      (in_city_on vienna day5)
      (in_city_on vienna day6)
      (in_city_on vienna day7)

      (in_city_on venice day8)
      (in_city_on venice day9)
      (in_city_on venice day10)
      (in_city_on venice day11)

      (wedding_done)
    )
  )
)