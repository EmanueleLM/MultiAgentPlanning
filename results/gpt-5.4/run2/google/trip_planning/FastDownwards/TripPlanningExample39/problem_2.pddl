(define (problem tripplanningexample39_problem)
  (:domain tripplanningexample39)

  (:objects
    porto barcelona florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
  )

  (:init
    (at porto)
    (current_day day_1)
    (visited_on day_1 porto)

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

    (direct_flight porto barcelona)
    (direct_flight barcelona porto)
    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
  )

  (:goal
    (and
      (visited_on day_1 porto)
      (visited_on day_2 porto)
      (visited_on day_3 porto)

      (visited_on day_4 barcelona)
      (visited_on day_5 barcelona)
      (visited_on day_6 barcelona)
      (visited_on day_7 barcelona)
      (visited_on day_8 barcelona)
      (visited_on day_9 barcelona)
      (visited_on day_10 barcelona)

      (visited_on day_11 florence)
      (visited_on day_12 florence)
    )
  )
)