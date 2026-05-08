(define (problem european_trip_16_days_instance_problem)
  (:domain european_trip_16_days_instance)

  (:objects
    athens zurich krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 - day
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

    (direct_flight zurich krakow)
    (direct_flight krakow zurich)
    (direct_flight athens zurich)
    (direct_flight zurich athens)

    (athens_window_day day_1)
    (athens_window_day day_2)
    (athens_window_day day_3)
    (athens_window_day day_4)
    (athens_window_day day_5)
    (athens_window_day day_6)
    (athens_window_day day_7)

    (athens_need_7)
    (zurich_need_5)
    (krakow_need_6)
  )

  (:goal
    (and
      (current_day day_17)

      (spent_in day_1 athens)
      (spent_in day_2 athens)
      (spent_in day_3 athens)
      (spent_in day_4 athens)
      (spent_in day_5 athens)
      (spent_in day_6 athens)
      (spent_in day_7 athens)

      (not (athens_need_7))
      (not (athens_need_6))
      (not (athens_need_5))
      (not (athens_need_4))
      (not (athens_need_3))
      (not (athens_need_2))
      (not (athens_need_1))

      (not (zurich_need_5))
      (not (zurich_need_4))
      (not (zurich_need_3))
      (not (zurich_need_2))
      (not (zurich_need_1))

      (not (krakow_need_6))
      (not (krakow_need_5))
      (not (krakow_need_4))
      (not (krakow_need_3))
      (not (krakow_need_2))
      (not (krakow_need_1))
    )
  )
)