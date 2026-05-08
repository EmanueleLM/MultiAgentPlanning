(define (problem european_trip_16_days_compact_problem)
  (:domain european_trip_16_days_compact)

  (:objects
    athens zurich krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
    c1 c2 c3 c4 c5 c6 c7 done - count
  )

  (:init
    (current_day day_1)
    (at athens)

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
    (next_day day_16 day_17)

    (direct athens zurich)
    (direct zurich athens)
    (direct zurich krakow)
    (direct krakow zurich)

    (athens_window day_1)
    (athens_window day_2)
    (athens_window day_3)
    (athens_window day_4)
    (athens_window day_5)
    (athens_window day_6)
    (athens_window day_7)

    (succ c7 c6)
    (succ c6 c5)
    (succ c5 c4)
    (succ c4 c3)
    (succ c3 c2)
    (succ c2 c1)
    (succ c1 done)

    (need_athens c7)
    (need_zurich c5)
    (need_krakow c6)
  )

  (:goal
    (and
      (current_day day_17)
      (need_athens done)
      (need_zurich done)
      (need_krakow done))
  )
)