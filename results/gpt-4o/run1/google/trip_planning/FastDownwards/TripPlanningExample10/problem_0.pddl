(define (problem trip_plan)
  (:domain european_trip)
  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    trip_planner - planner
  )
  (:init
    (current_city trip_planner oslo)
    (day_in_trip day1)
    (consecutive day1 day2)
    (consecutive day2 day3)
    (consecutive day3 day4)
    (consecutive day4 day5)
    (consecutive day5 day6)
    (consecutive day6 day7)
    (consecutive day7 day8)
    (consecutive day8 day9)
    (can_fly oslo dublin)
    (can_fly dublin valencia)
    (not (visited trip_planner dublin))
    (not (visited trip_planner valencia))
  )
  (:goal (and
    (visited trip_planner oslo)
    (visited trip_planner dublin)
    (visited trip_planner valencia)
    (day_in_trip day9)
  ))
)