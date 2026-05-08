(define (problem tripplanningexample8_problem)
  (:domain tripplanningexample8)

  (:objects
    athens krakow zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )

  (:init
    (direct athens zurich)
    (direct zurich athens)
    (direct zurich krakow)
    (direct krakow zurich)

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
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)

    (dec c7 c6)
    (dec c6 c5)
    (dec c5 c4)
    (dec c4 c3)
    (dec c3 c2)
    (dec c2 c1)
    (dec c1 c0)

    (in_athens_window day_1)
    (in_athens_window day_2)
    (in_athens_window day_3)
    (in_athens_window day_4)
    (in_athens_window day_5)
    (in_athens_window day_6)
    (in_athens_window day_7)

    (current_day day_1)
    (at athens)

    (remaining_athens c7)
    (remaining_krakow c6)
    (remaining_zurich c5)
  )

  (:goal
    (and
      (current_day day_16)
      (remaining_athens c0)
      (remaining_krakow c0)
      (remaining_zurich c0)
      (athens_window_satisfied)
    )
  )
)