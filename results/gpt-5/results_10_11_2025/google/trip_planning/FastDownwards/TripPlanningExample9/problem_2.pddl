(define (problem tripplanningexample9-problem)
  (:domain tripplanningexample9)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    tB1 tB2 tB3 - token
    tF1 tF2 tF3 - token
    tS1 tS2 tS3 tS4 - token
  )

  (:init
    (current day1)
    (first day1)
    (last day10)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (in-window day5)
    (in-window day6)
    (in-window day7)
    (in-window day8)
    (in-window day9)
    (in-window day10)

    (edge bucharest frankfurt)
    (edge frankfurt bucharest)
    (edge frankfurt stuttgart)
    (edge stuttgart frankfurt)

    (btoken tB1) (available tB1)
    (btoken tB2) (available tB2)
    (btoken tB3) (available tB3)

    (ftoken tF1) (available tF1)
    (ftoken tF2) (available tF2)
    (ftoken tF3) (available tF3)

    (stoken tS1) (available tS1)
    (stoken tS2) (available tS2)
    (stoken tS3) (available tS3)
    (stoken tS4) (available tS4)
  )

  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)
      (assigned day9)
      (assigned day10)
      (workshop-done)
    )
  )
)