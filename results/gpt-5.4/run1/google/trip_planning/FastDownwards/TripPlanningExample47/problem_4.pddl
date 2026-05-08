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

    (at paris day_1)
    (visited paris)
  )

  (:goal
    (and
      (visited paris)
      (visited istanbul)
      (visited salzburg)

      (at paris day_1)
      (at paris day_2)

      (at istanbul day_3)
      (at istanbul day_4)

      (at salzburg day_3)
      (at salzburg day_4)
      (at salzburg day_5)
      (at salzburg day_6)
      (at salzburg day_7)
    )
  )
)