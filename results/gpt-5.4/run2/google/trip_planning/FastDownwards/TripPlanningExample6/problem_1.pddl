(define (problem trip_planning_example6_problem)
  (:domain trip_planning_example6)

  (:objects
    berlin munich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (direct munich dubrovnik)
    (direct dubrovnik munich)
    (direct berlin munich)
    (direct munich berlin)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)

    (current_day day_1)
    (at berlin)
  )

  (:goal
    (and
      (closed day_1)
      (closed day_2)
      (closed day_3)
      (closed day_4)
      (closed day_5)
      (closed day_6)
      (closed day_7)
      (closed day_8)

      (visited_on day_1 berlin)
      (visited_on day_4 berlin)

      (visited_on day_1 berlin)
      (visited_on day_2 berlin)
      (visited_on day_3 berlin)
      (visited_on day_4 berlin)

      (visited_on day_5 munich)

      (visited_on day_6 dubrovnik)
      (visited_on day_7 dubrovnik)
      (visited_on day_8 dubrovnik)
    )
  )
)