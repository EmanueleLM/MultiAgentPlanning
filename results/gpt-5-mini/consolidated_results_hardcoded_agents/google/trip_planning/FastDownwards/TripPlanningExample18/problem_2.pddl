(define (problem travel_problem_multiagent)
  (:domain travel_multiagent)
  (:objects
    amsterdam vilnius bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    (connected amsterdam bucharest)
    (connected bucharest amsterdam)
    (connected vilnius amsterdam)
    (connected amsterdam vilnius)

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

    (at amsterdam day1)
    (occupied day1)

    (meeting_window day6)
    (meeting_window day7)
    (meeting_window day8)
    (meeting_window day9)
    (meeting_window day10)
    (meeting_window day11)
  )
  (:goal (and
    (occupied day1) (occupied day2) (occupied day3) (occupied day4) (occupied day5)
    (occupied day6) (occupied day7) (occupied day8) (occupied day9) (occupied day10)
    (occupied day11)
    (met_friends)
  ))
)