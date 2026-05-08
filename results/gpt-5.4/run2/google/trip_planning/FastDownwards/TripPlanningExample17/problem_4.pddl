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

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)

    (final_day day_11)

    (current day_1)
    (at copenhagen)
    (assigned day_1 copenhagen)

    (need_copenhagen_start)
    (need_copenhagen_end)
    (need_vienna_start)
    (need_vienna_end)
    (need_lyon_start)
    (need_lyon_end)
  )

  (:goal
    (and
      (current day_11)

      (assigned day_1 copenhagen)
      (assigned day_2 copenhagen)
      (assigned day_3 copenhagen)
      (assigned day_4 copenhagen)
      (assigned day_5 copenhagen)

      (assigned day_6 vienna)
      (assigned day_7 vienna)
      (assigned day_8 vienna)
      (assigned day_9 vienna)

      (assigned day_8 lyon)
      (assigned day_9 lyon)
      (assigned day_10 lyon)
      (assigned day_11 lyon)

      (finished_copenhagen)
      (finished_vienna)
      (finished_lyon)
    )
  )
)