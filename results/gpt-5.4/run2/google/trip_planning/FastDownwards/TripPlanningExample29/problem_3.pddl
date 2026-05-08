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

    (need_frankfurt_1)
    (need_dubrovnik_1)
    (need_krakow_1)
  )

  (:goal
    (and
      (current_day day10)
      (at krakow)

      (visited krakow day9)
      (visited krakow day10)

      (not (need_frankfurt_1))
      (not (need_frankfurt_2))
      (not (need_frankfurt_3))

      (not (need_dubrovnik_1))
      (not (need_dubrovnik_2))
      (not (need_dubrovnik_3))
      (not (need_dubrovnik_4))
      (not (need_dubrovnik_5))
      (not (need_dubrovnik_6))
      (not (need_dubrovnik_7))

      (not (need_krakow_1))
      (not (need_krakow_2))
    )
  )
)