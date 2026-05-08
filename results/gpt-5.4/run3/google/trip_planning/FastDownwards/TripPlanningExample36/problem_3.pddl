(define (problem trip_planning_example36_instance)
  (:domain trip_planning_example36)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    (current_day day1)
    (at florence day1)
    (counted_florence day1)

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
    (next day12 day13)

    (direct florence munich)
    (direct munich florence)
    (direct florence warsaw)
    (direct warsaw florence)
    (direct munich warsaw)
    (direct warsaw munich)
  )

  (:goal
    (and
      (current_day day13)
      (counted_florence day1)
      (counted_florence day2)
      (counted_munich day3)
      (counted_munich day4)
      (counted_munich day5)
      (counted_munich day6)
      (counted_munich day7)
      (counted_munich day8)
      (counted_warsaw day9)
      (counted_warsaw day10)
      (counted_warsaw day11)
      (counted_warsaw day12)
      (counted_warsaw day13)
    )
  )
)