(define (problem tripplanningexample34_problem)
  (:domain tripplanningexample34)

  (:objects
    frankfurt florence valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (at valencia)
    (current_day day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (direct frankfurt florence)
    (direct florence frankfurt)
    (direct valencia frankfurt)
    (direct frankfurt valencia)

    (required_start valencia day_1)
    (required_end valencia day_3)

    (required_start frankfurt day_3)
    (required_end frankfurt day_8)

    (required_start florence day_6)
    (required_end florence day_10)
  )

  (:goal
    (and
      (final_day_reached)
    )
  )
)