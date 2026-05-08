(define (problem trip_planning_problem)
    (:domain trip_planning)
    (:objects
      stockholm athens mykonos - city
      day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
      s0 s1 s2 s3 s4 s5 s6 - step
    )
    (:init
      (at stockholm)
      (current_day day1)
      
      (count stockholm s0)
      (count athens s0)
      (count mykonos s0)
      
      (next_step s0 s1)
      (next_step s1 s2)
      (next_step s2 s3)
      (next_step s3 s4)
      (next_step s4 s5)
      (next_step s5 s6)
      
      (next_day day1 day2)
      (next_day day2 day3)
      (next_day day3 day4)
      (next_day day4 day5)
      (next_day day5 day6)
      (next_day day6 day7)
      (next_day day7 day8)
      (next_day day8 day9)
      (next_day day9 day10)
      (next_day day10 day11)
      (next_day day11 day12)
      (next_day day12 day13)
      
      (can_fly stockholm athens)
      (can_fly athens stockholm)
      (can_fly athens mykonos)
      (can_fly mykonos athens)
    )
    (:goal
      (and
        (count stockholm s6)
        (count athens s5)
        (count mykonos s4)
        (spent stockholm day1)
        (spent stockholm day6)
      )
    )
  )