(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    valencia amsterdam tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )
  (:init
    (free day1) (free day2) (free day3) (free day4) (free day5)
    (free day6) (free day7) (free day8) (free day9) (free day10)
    (free day11) (free day12) (free day13) (free day14) (free day15)

    (flight amsterdam tallinn)
    (flight tallinn amsterdam)
    (flight valencia amsterdam)
    (flight amsterdam valencia)

    (count-valencia-0)
    (count-amsterdam-0)
    (count-tallinn-0)
    (count-total-0)

    (= (total-cost) 0)
  )
  (:goal (and
    (count-valencia-5)
    (count-amsterdam-5)
    (count-tallinn-7)
    (count-total-15)
    (meeting-satisfied)
  ))
  (:metric minimize (total-cost))
)