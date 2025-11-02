(define (problem TripPlanningExample0)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    florence barcelona helsinki - location
  )
  (:init
    (at day1 barcelona)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)
    (empty day2) (empty day3) (empty day4) (empty day5) (empty day6) (empty day7)
    (empty day8) (empty day9) (empty day10) (empty day11) (empty day12) (empty day13) (empty day14)
    (can-fly barcelona florence)
    (can-fly florence barcelona)
    (can-fly helsinki barcelona)
    (can-fly barcelona helsinki)
  )
  (:goal (and
    (at day1 barcelona) (at day2 barcelona) (at day3 barcelona) (at day4 barcelona) (at day5 barcelona)
    (at day6 helsinki) (at day7 helsinki)
    (at day8 barcelona)
    (at day9 florence) (at day10 florence) (at day11 florence) (at day12 florence) (at day13 florence) (at day14 florence)
  ))
)