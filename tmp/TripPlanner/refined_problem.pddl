(define (problem travel-planning)
  (:domain travel)
  (:objects
    london bucharest reykjavik - location
    ; day objects for the calendar
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    ; count objects used to record days-in-location (we only need c4, c5, c7 for the goal, but include others if desired)
    c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 - count)
  (:init
    (at london)
    (at-day day1)
    (next-day-sequence day1 day2)
    (next-day-sequence day2 day3)
    (next-day-sequence day3 day4)
    (next-day-sequence day4 day5)
    (next-day-sequence day5 day6)
    (next-day-sequence day6 day7)
    (next-day-sequence day7 day8)
    (next-day-sequence day8 day9)
    (next-day-sequence day9 day10)
    (next-day-sequence day10 day11)
    (next-day-sequence day11 day12)
    (next-day-sequence day12 day13)
    (next-day-sequence day13 day14)
    (has-flight london bucharest)
    (has-flight reykjavik london)
    (has-flight london reykjavik))
  (:goal
    (and 
      (visited london)
      (visited bucharest)
      (visited reykjavik)
      (at-day day14)
      (days-in-location london c4)
      (days-in-location bucharest c5)
      (days-in-location reykjavik c7))))