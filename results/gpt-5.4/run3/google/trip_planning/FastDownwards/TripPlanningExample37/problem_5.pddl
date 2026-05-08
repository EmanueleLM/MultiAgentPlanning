(define (problem tripplanningexample37_problem)
  (:domain tripplanningexample37)

  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)

    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)

    (current_day day_1)
  )

  (:goal
    (and
      (current_day day_10)

      (at reykjavik day_1)
      (at reykjavik day_2)
      (at reykjavik day_3)
      (at reykjavik day_4)
      (at reykjavik day_5)
      (at reykjavik day_6)

      (at milan day_7)
      (at milan day_8)

      (at porto day_9)
      (at porto day_10)
    )
  )
)