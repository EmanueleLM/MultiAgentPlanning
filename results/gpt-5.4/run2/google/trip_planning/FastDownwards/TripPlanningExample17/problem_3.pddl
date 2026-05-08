(define (problem tripplanningexample17_problem)
  (:domain tripplanningexample17)

  (:objects
    copenhagen vienna lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    seg1 seg2 seg3 - segment
  )

  (:init
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

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

    (segment_city seg1 copenhagen)
    (first_day seg1 day1)
    (last_day seg1 day5)

    (segment_city seg2 vienna)
    (first_day seg2 day6)
    (last_day seg2 day9)

    (segment_city seg3 lyon)
    (first_day seg3 day10)
    (last_day seg3 day11)

    (next_segment seg1 seg2)
    (next_segment seg2 seg3)

    (segment_open seg1)

    (current day1 copenhagen)
  )

  (:goal
    (and
      (segment_done seg1)
      (segment_done seg2)
      (segment_done seg3)
      (current day11 lyon)
      (day_used day1)
      (day_used day2)
      (day_used day3)
      (day_used day4)
      (day_used day5)
      (day_used day6)
      (day_used day7)
      (day_used day8)
      (day_used day9)
      (day_used day10)
      (day_used day11)
    )
  )
)