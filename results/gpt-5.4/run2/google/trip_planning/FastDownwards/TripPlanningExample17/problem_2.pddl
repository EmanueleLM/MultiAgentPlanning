(define (problem tripplanningexample17_problem)
  (:domain tripplanningexample17)

  (:objects
    copenhagen vienna lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

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
    (at copenhagen)

    (need_copenhagen_1)
    (need_vienna_1)
    (need_lyon_1)
  )

  (:goal
    (and
      (trip_complete)
      (visited_on day_1 copenhagen)
      (visited_on day_5 copenhagen)
      (not (need_copenhagen_1))
      (not (need_copenhagen_2))
      (not (need_copenhagen_3))
      (not (need_copenhagen_4))
      (not (need_copenhagen_5))
      (not (need_vienna_1))
      (not (need_vienna_2))
      (not (need_vienna_3))
      (not (need_vienna_4))
      (not (need_lyon_1))
      (not (need_lyon_2))
      (not (need_lyon_3))
      (not (need_lyon_4))
    )
  )
)