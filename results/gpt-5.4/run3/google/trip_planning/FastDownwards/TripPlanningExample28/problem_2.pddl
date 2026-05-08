(define (problem tripplanningexample28)
  (:domain european_trip_12_days_instance)

  (:objects
    venice florence zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (at venice)
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
    (next_day day_12 day_13)

    (direct_flight venice zurich)
    (direct_flight zurich venice)
    (direct_flight zurich florence)
  )

  (:goal
    (and
      (current_day day_13)
      (spent_in day_1 venice)
      (spent_in day_2 venice)
      (spent_in day_3 venice)
      (spent_in day_4 venice)
      (spent_in day_5 venice)
      (spent_in day_6 zurich)
      (spent_in day_7 zurich)
      (spent_in day_8 florence)
      (spent_in day_9 florence)
      (spent_in day_10 florence)
      (spent_in day_11 florence)
      (spent_in day_12 florence)
    )
  )
)