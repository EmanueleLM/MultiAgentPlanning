(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    frankfurt bucharest stuttgart - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)

    (at frankfurt day1)
    (day-assigned day1)

    (can-travel frankfurt bucharest)
    (can-travel bucharest frankfurt)
    (can-travel frankfurt stuttgart)
    (can-travel stuttgart frankfurt)
  )

  (:goal
    (and
      (at frankfurt day1)
      (at frankfurt day2)
      (at frankfurt day6)

      (at bucharest day3)
      (at bucharest day4)
      (at bucharest day5)

      (at stuttgart day7)
      (at stuttgart day8)
      (at stuttgart day9)
      (at stuttgart day10)
    )
  )
)