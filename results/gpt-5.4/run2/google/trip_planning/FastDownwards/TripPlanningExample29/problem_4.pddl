(define (problem tripplanningexample29_problem)
  (:domain tripplanningexample29)

  (:objects
    frankfurt krakow dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (current_day day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct frankfurt dubrovnik)
    (direct dubrovnik frankfurt)

    (wedding_day day9)
    (wedding_day day10)
  )

  (:goal
    (and
      (current_day day10)

      (visited frankfurt)
      (visited krakow)
      (visited dubrovnik)

      (allocated dubrovnik day1)
      (allocated dubrovnik day2)
      (allocated dubrovnik day3)
      (allocated dubrovnik day4)
      (allocated dubrovnik day5)
      (allocated dubrovnik day6)
      (allocated dubrovnik day7)

      (allocated frankfurt day8)

      (allocated krakow day9)
      (allocated krakow day10)
      (at krakow)
    )
  )
)