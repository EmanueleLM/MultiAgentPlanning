(define (problem tripplanningexample28_problem)
  (:domain tripplanningexample28)

  (:objects
    venice florence zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
    c0 c1 c2 c3 c4 c5 c6 - stay_count
  )

  (:init
    (direct_flight venice zurich)
    (direct_flight zurich venice)
    (direct_flight zurich florence)

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

    (required_final_day day_13)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)

    (current_day day_1)
    (at venice)

    (count_venice c1)
    (count_florence c0)
    (count_zurich c0)
  )

  (:goal
    (and
      (trip_complete))
  )
)