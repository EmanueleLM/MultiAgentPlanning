(define (problem tripplanningexample6_problem)
  (:domain tripplanningexample6)

  (:objects
    berlin munich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (at berlin)
    (current day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)

    (direct berlin munich)
    (direct munich berlin)
    (direct munich dubrovnik)
    (direct dubrovnik munich)

    (required_city day_1 berlin)
    (required_city day_4 berlin)

    (need_block_berlin)
    (need_block_munich)
    (need_block_dubrovnik)

    (berlin_start day_1)

    (munich_start day_2)
    (munich_start day_5)
    (munich_start day_6)

    (dubrovnik_start day_2)
    (dubrovnik_start day_5)
    (dubrovnik_start day_6)
  )

  (:goal
    (and
      (berlin_done)
      (munich_done)
      (dubrovnik_done)
      (visited_on berlin day_1)
      (visited_on berlin day_4)
      (trip_finished)
    )
  )
)