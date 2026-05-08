(define (problem trip_planning_example19_problem)
  (:domain trip_planning_example19)

  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (current_day day1)
  )

  (:goal
    (and
      (current_day day9)

      (at nice day1)
      (at nice day2)
      (at nice day3)
      (at nice day4)
      (at nice day5)
      (at nice day6)

      (at brussels day7)
      (at brussels day8)

      (at valencia day9)

      (visited_nice_in_window)
    )
  )
)