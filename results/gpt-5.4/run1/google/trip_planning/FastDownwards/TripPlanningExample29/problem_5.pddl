(define (problem trip_planning_example29_problem)
  (:domain trip_planning_example29)

  (:objects
    frankfurt krakow dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
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

    (current_day day1)

    (wedding_window day9)
    (wedding_window day10)
  )

  (:goal
    (and
      (visited frankfurt)
      (visited krakow)
      (visited dubrovnik)

      (day_in_dubrovnik day1)
      (day_in_dubrovnik day2)
      (day_in_dubrovnik day3)
      (day_in_dubrovnik day4)
      (day_in_dubrovnik day5)
      (day_in_dubrovnik day6)
      (day_in_dubrovnik day7)

      (day_in_frankfurt day1)
      (day_in_frankfurt day2)
      (day_in_frankfurt day3)

      (day_in_krakow day9)
      (day_in_krakow day10)

      (wedding_attended)
    )
  )
)