(define (problem trip_11_days_three_cities_instance)
  (:domain trip_11_days_three_cities)

  (:objects
    seville manchester stockholm - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)
    (at stockholm)
    (occupied day_1 stockholm)
    (visited_stockholm_on day_1)

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

    (direct_flight manchester seville)
    (direct_flight seville manchester)
    (direct_flight stockholm manchester)
    (direct_flight manchester stockholm)
  )

  (:goal
    (and
      (occupied day_1 stockholm)
      (occupied day_3 stockholm)

      (occupied day_11 seville)
      (occupied day_11 manchester)
      (occupied day_11 stockholm)

      (visited_seville_on day_1)
      (visited_seville_on day_2)
      (visited_seville_on day_3)
      (visited_seville_on day_4)
      (visited_seville_on day_5)

      (visited_manchester_on day_1)
      (visited_manchester_on day_2)
      (visited_manchester_on day_3)
      (visited_manchester_on day_4)
      (visited_manchester_on day_5)

      (visited_stockholm_on day_1)
      (visited_stockholm_on day_2)
      (visited_stockholm_on day_3)
    )
  )
)