(define (problem european_trip_16_days_instance)
  (:domain european_trip_16_days)

  (:objects
    valencia split lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 - count
  )

  (:init
    (direct lyon split)
    (direct split lyon)
    (direct valencia lyon)
    (direct lyon valencia)

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

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)
    (next_count c11 c12)
    (next_count c12 c13)
    (next_count c13 c14)
    (next_count c14 c15)
    (next_count c15 c16)

    (today day_1)
    (valencia_count c0)
    (split_count c0)
    (lyon_count c0)
  )

  (:goal
    (and
      (today day_16)
      (assigned day_16)

      (at split day_10)
      (at split day_11)
      (at split day_12)
      (at split day_13)
      (at split day_14)
      (at split day_15)
      (at split day_16)

      (valencia_count c5)
      (split_count c7)
      (lyon_count c6)
    )
  )
)