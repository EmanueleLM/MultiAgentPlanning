(define (problem tripplanningexample47)
  (:domain tripplanningexample47)

  (:objects
    paris istanbul salzburg - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 - day
  )

  (:init
    (direct paris istanbul)
    (direct istanbul paris)
    (direct istanbul salzburg)
    (direct salzburg istanbul)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)

    (current_city paris)
    (current_day day_1)
    (in paris day_1)
  )

  (:goal
    (and
      (current_day day_7)

      (in paris day_2)

      (in istanbul day_3)
      (in istanbul day_4)

      (in salzburg day_3)
      (in salzburg day_4)
      (in salzburg day_5)
      (in salzburg day_6)
      (in salzburg day_7)
    )
  )
)