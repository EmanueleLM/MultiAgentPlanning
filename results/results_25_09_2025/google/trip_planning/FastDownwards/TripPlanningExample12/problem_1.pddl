(define (problem visit-valencia-amsterdam-tallinn)
  (:domain trip-planning)
  (:objects
    valencia amsterdam tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    (at valencia day1)

    (next-day day1 day2) (next-day day2 day3) (next-day day3 day4) (next-day day4 day5)
    (next-day day5 day6) (next-day day6 day7) (next-day day7 day8) (next-day day8 day9)
    (next-day day9 day10) (next-day day10 day11) (next-day day11 day12) (next-day day12 day13)
    (next-day day13 day14) (next-day day14 day15)

    (direct valencia amsterdam)
    (direct amsterdam valencia)
    (direct amsterdam tallinn)
    (direct tallinn amsterdam)

    (day-range9-15 day9) (day-range9-15 day10) (day-range9-15 day11)
    (day-range9-15 day12) (day-range9-15 day13) (day-range9-15 day14)
    (day-range9-15 day15)

    (is-valencia valencia)
    (is-amsterdam amsterdam)
    (is-tallinn tallinn)
  )

  (:goal (and
    (at valencia day5)
    (at amsterdam day10)
    (at tallinn day11)
    (met-friend)
  ))
)