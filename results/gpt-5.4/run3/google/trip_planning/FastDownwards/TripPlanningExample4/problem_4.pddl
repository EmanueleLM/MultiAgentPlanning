(define (problem tripplanningexample4)
  (:domain european_trip_12_days)

  (:objects
    seville munich tallinn - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
  )

  (:init
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
    (next_day day_11 day_12)

    (direct_flight seville munich)
    (direct_flight munich seville)
    (direct_flight munich tallinn)
    (direct_flight tallinn munich)

    (friend_window day_11)
    (friend_window day_12)
  )

  (:goal
    (and
      (visited_on seville day_1)
      (visited_on seville day_2)
      (visited_on seville day_3)
      (visited_on seville day_4)
      (visited_on seville day_5)
      (visited_on seville day_6)
      (visited_on seville day_7)

      (visited_on munich day_8)
      (visited_on munich day_9)
      (visited_on munich day_10)
      (visited_on munich day_11)
      (visited_on munich day_12)

      (visited_on tallinn day_11)
      (visited_on tallinn day_12)

      (met_friend)
      (current_day day_12)
    )
  )
)