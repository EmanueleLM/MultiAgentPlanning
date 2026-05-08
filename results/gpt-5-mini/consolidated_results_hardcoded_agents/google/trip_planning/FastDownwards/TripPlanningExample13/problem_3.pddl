(define (problem trip17)
  (:domain trip-planning)
  (:objects
    traveler - person
    lyon bucharest manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )
  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16) (next day16 day17)
    (at traveler manchester day1)
    (occupied day1)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)
  )
  (:goal (and
    ;; Manchester for 5 days (day1-day5)
    (at traveler manchester day1)
    (at traveler manchester day2)
    (at traveler manchester day3)
    (at traveler manchester day4)
    (at traveler manchester day5)

    ;; Bucharest for 7 days (day6-day12)
    (at traveler bucharest day6)
    (at traveler bucharest day7)
    (at traveler bucharest day8)
    (at traveler bucharest day9)
    (at traveler bucharest day10)
    (at traveler bucharest day11)
    (at traveler bucharest day12)

    ;; Lyon for 5 days within relatives window (day13-day17)
    (at traveler lyon day13)
    (at traveler lyon day14)
    (at traveler lyon day15)
    (at traveler lyon day16)
    (at traveler lyon day17)
  )))