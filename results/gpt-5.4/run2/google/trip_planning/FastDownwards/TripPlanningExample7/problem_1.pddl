(define (problem tripplanningexample7)
  (:domain european_trip_11_days)

  (:objects
    dubrovnik istanbul venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (at dubrovnik)
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)

    (direct_flight dubrovnik istanbul)
    (direct_flight istanbul dubrovnik)
    (direct_flight dubrovnik venice)
    (direct_flight venice dubrovnik)
  )

  (:goal
    (and
      (current_day day_11)

      (visited_venice day_1)
      (visited_venice day_2)
      (visited_venice day_3)
      (visited_venice day_4)
      (visited_venice day_5)
      (visited_venice day_6)

      (visited_dubrovnik day_1)
      (visited_dubrovnik day_2)
      (visited_dubrovnik day_3)
      (visited_dubrovnik day_4)

      (visited_istanbul day_1)
      (visited_istanbul day_2)
      (visited_istanbul day_3)
    )
  )
)