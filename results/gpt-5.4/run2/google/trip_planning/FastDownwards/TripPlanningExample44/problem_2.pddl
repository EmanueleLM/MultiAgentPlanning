(define (problem trip_planning_example44_problem)
  (:domain trip_planning_example44)

  (:objects
    rome lyon zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 day_18 - day
  )

  (:init
    (at rome)
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
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)
    (next_day day_16 day_17)
    (next_day day_17 day_18)

    (direct_flight rome lyon)
    (direct_flight lyon rome)
    (direct_flight rome zurich)
    (direct_flight zurich rome)

    (wedding_window day_1)
    (wedding_window day_2)
    (wedding_window day_3)
    (wedding_window day_4)
    (wedding_window day_5)
    (wedding_window day_6)
    (wedding_window day_7)
  )

  (:goal
    (and
      (current_day day_18)
      (wedding_attended)

      (in_city_on rome day_1)
      (in_city_on rome day_2)
      (in_city_on rome day_3)
      (in_city_on rome day_4)
      (in_city_on rome day_5)
      (in_city_on rome day_6)

      (in_city_on lyon day_7)
      (in_city_on lyon day_8)
      (in_city_on lyon day_9)
      (in_city_on lyon day_10)
      (in_city_on lyon day_11)
      (in_city_on lyon day_12)

      (in_city_on zurich day_13)
      (in_city_on zurich day_14)
      (in_city_on zurich day_15)
      (in_city_on zurich day_16)
      (in_city_on zurich day_17)
      (in_city_on zurich day_6)
      (in_city_on zurich day_7)
    )
  )
)