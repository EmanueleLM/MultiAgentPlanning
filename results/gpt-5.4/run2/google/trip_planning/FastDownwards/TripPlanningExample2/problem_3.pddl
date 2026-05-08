(define (problem tripplanningexample2_problem)
  (:domain tripplanningexample2)

  (:objects
    reykjavik vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at reykjavik)
    (current day1)

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

    (final day11)

    (direct reykjavik vienna)
    (direct vienna reykjavik)
    (direct vienna venice)
    (direct venice vienna)

    (must_be_in reykjavik day1)
    (must_be_in reykjavik day2)

    (must_be_in vienna day3)
    (must_be_in vienna day4)
    (must_be_in vienna day5)
    (must_be_in vienna day6)
    (must_be_in vienna day7)
    (must_be_in vienna day8)
    (must_be_in vienna day9)

    (must_be_in venice day8)
    (must_be_in venice day9)
    (must_be_in venice day10)
    (must_be_in venice day11)

    (wedding_window day8)
    (wedding_window day9)
    (wedding_window day10)
    (wedding_window day11)
  )

  (:goal
    (and
      (visited reykjavik day1)
      (visited reykjavik day2)

      (visited vienna day3)
      (visited vienna day4)
      (visited vienna day5)
      (visited vienna day6)
      (visited vienna day7)
      (visited vienna day8)
      (visited vienna day9)

      (visited venice day8)
      (visited venice day9)
      (visited venice day10)
      (visited venice day11)

      (wedding_done)
    )
  )
)