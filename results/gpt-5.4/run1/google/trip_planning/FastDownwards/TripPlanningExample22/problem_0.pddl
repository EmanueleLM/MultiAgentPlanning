(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (connected berlin frankfurt)
    (connected frankfurt berlin)
    (connected frankfurt bucharest)
    (connected bucharest frankfurt)

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

    (current_day day_1)
    (at berlin)
    (occupied day_1 berlin)
    (visited_day day_1)
  )

  (:goal
    (and
      (current_day day_11)

      (visited_day day_1)
      (visited_day day_2)
      (visited_day day_3)
      (visited_day day_4)
      (visited_day day_5)
      (visited_day day_6)
      (visited_day day_7)
      (visited_day day_8)
      (visited_day day_9)
      (visited_day day_10)
      (visited_day day_11)

      (occupied day_1 berlin)
      (occupied day_2 berlin)
      (occupied day_3 berlin)
      (occupied day_4 berlin)
      (occupied day_5 berlin)
      (occupied day_6 berlin)
      (occupied day_7 berlin)

      (occupied day_8 frankfurt)
      (occupied day_9 frankfurt)
      (occupied day_10 frankfurt)
      (occupied day_11 frankfurt)

      (occupied day_10 bucharest)
      (occupied day_11 bucharest)
    )
  )
)