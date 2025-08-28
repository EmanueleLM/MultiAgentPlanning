(define (problem plan-14-day-trip)
  (:domain travel-planner)
  (:objects
    traveler1 - traveler
    london bucharest reykjavik - location
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    number1 number2 number3 number4 number5 number6 number7 number8 number9 number10 number11 number12 number13 number14 - number
  )

  (:init
    (at traveler1 london day1)
    (has-direct-flight london bucharest)
    (has-direct-flight reykjavik london)
    (next-day day1 day2) (next-day day2 day3) (next-day day3 day4)
    (next-day day4 day5) (next-day day5 day6) (next-day day6 day7)
    (next-day day7 day8) (next-day day8 day9) (next-day day9 day10)
    (next-day day10 day11) (next-day day11 day12) (next-day day12 day13)
    (next-day day13 day14)
    (= (stay-duration london) 4)
    (= (stay-duration bucharest) 5)
    (= (stay-duration reykjavik) 7)
    (assigned-day-number day1 number1) (= number1 1)
    (assigned-day-number day2 number2) (= number2 2)
    (assigned-day-number day3 number3) (= number3 3)
    (assigned-day-number day4 number4) (= number4 4)
    (assigned-day-number day5 number5) (= number5 5)
    (assigned-day-number day6 number6) (= number6 6)
    (assigned-day-number day7 number7) (= number7 7)
    (assigned-day-number day8 number8) (= number8 8)
    (assigned-day-number day9 number9) (= number9 9)
    (assigned-day-number day10 number10) (= number10 10)
    (assigned-day-number day11 number11) (= number11 11)
    (assigned-day-number day12 number12) (= number12 12)
    (assigned-day-number day13 number13) (= number13 13)
    (assigned-day-number day14 number14) (= number14 14)
  )
  
  (:goal
    (and 
      (at traveler1 reykjavik day14)
      (at traveler1 bucharest day10)
      (at traveler1 bucharest day11)
      (at traveler1 bucharest day12)
      (at traveler1 bucharest day13)
    )
  )
)