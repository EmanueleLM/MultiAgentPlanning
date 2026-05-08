(define (problem plan_trip)
  (:domain trip_planning)
  (:objects
    bucharest zurich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    (in_city bucharest)
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
  )
  (:goal (and
    (has_visited bucharest)
    (has_visited zurich)
    (has_visited dubrovnik)
    (in_city dubrovnik)
    (at_relatives)
  ))
)