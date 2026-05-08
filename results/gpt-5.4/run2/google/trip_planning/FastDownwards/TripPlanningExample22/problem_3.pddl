(define (problem tripplanningexample22_problem)
  (:domain tripplanningexample22)

  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct_flight berlin frankfurt)
    (direct_flight frankfurt berlin)
    (direct_flight frankfurt bucharest)
    (direct_flight bucharest frankfurt)

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

    (current_city berlin)
    (current_day day_1)
    (in_berlin_segment)

    (berlin_day day_1)
  )

  (:goal
    (and
      (current_day day_11)
      (current_city bucharest)
      (in_bucharest_segment)
      (finished_berlin_segment)
      (finished_frankfurt_segment)

      (berlin_day day_1)
      (berlin_day day_2)
      (berlin_day day_3)
      (berlin_day day_4)
      (berlin_day day_5)
      (berlin_day day_6)
      (berlin_day day_7)

      (frankfurt_day day_8)
      (frankfurt_day day_9)
      (frankfurt_day day_10)
      (frankfurt_day day_11)

      (bucharest_day day_10)
      (bucharest_day day_11)
    )
  )
)