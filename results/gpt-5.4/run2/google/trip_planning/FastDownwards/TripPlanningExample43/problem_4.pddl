(define (problem tripplanningexample43_problem)
  (:domain tripplanningexample43)

  (:objects
    dublin porto venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (direct_flight dublin porto)
    (direct_flight porto dublin)
    (direct_flight venice dublin)
    (direct_flight dublin venice)

    (friends_window day_1)
    (friends_window day_2)
    (friends_window day_3)
    (friends_window day_4)

    (venice_start_candidate day_1)
    (venice_start_candidate day_2)
    (venice_start_candidate day_3)
    (venice_start_candidate day_4)
    (venice_start_candidate day_5)
    (venice_start_candidate day_6)
    (venice_start_candidate day_7)

    (porto_start_candidate day_1)
    (porto_start_candidate day_2)
    (porto_start_candidate day_3)
    (porto_start_candidate day_4)
    (porto_start_candidate day_5)
    (porto_start_candidate day_6)
    (porto_start_candidate day_7)
  )

  (:goal
    (and
      (current_day day_10)
      (met_friends)
      (venice_block_started)
      (venice_block_ended)
      (porto_block_started)
      (porto_block_ended)
      (occupied dublin day_10)
    )
  )
)