(define (problem trip-venice-zurich-florence-12days)
  (:domain trip-planning)
  (:objects
    venice zurich florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )
  (:init
    (at venice)
    (flight venice zurich)
    (flight zurich venice)
    (flight zurich florence)
    (day-free day1) (day-free day2) (day-free day3) (day-free day4)
    (day-free day5) (day-free day6) (day-free day7) (day-free day8)
    (day-free day9) (day-free day10) (day-free day11) (day-free day12)
  )
  (:goal
    (and
      (assigned day1 venice) (assigned day2 venice) (assigned day3 venice)
      (assigned day4 venice) (assigned day5 venice) (assigned day6 venice)
      (assigned day7 zurich) (assigned day8 zurich)
      (assigned day9 florence) (assigned day10 florence)
      (assigned day11 florence) (assigned day12 florence)
    )
  )
)