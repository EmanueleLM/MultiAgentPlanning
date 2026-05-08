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

    (conference day_1 copenhagen)
    (conference day_5 copenhagen)

    (at copenhagen)
    (current_day day_1)
    (visited day_1 copenhagen)
  )

  (:goal
    (and
      (current_day day_11)

      (visited day_1 copenhagen)
      (visited day_5 copenhagen)

      (visited day_1 copenhagen)
      (visited day_2 copenhagen)
      (visited day_3 copenhagen)
      (visited day_4 copenhagen)
      (visited day_5 copenhagen)

      (visited day_6 vienna)
      (visited day_7 vienna)
      (visited day_8 vienna)
      (visited day_9 vienna)

      (visited day_8 lyon)
      (visited day_9 lyon)
      (visited day_10 lyon)
      (visited day_11 lyon)
    )
  )
)