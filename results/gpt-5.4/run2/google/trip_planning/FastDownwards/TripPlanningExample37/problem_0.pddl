(define (problem europe_trip_10_days_instance_problem)
  (:domain europe_trip_10_days_instance)

  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)

    (current_day day_1)

    (at reykjavik)
    (at milan)
    (at porto)
  )

  (:goal
    (and
      (current_day day_10)

      (visited_on porto day_9)
      (visited_on porto day_10)

      (visited_on reykjavik day_1)
      (visited_on reykjavik day_2)
      (visited_on reykjavik day_3)
      (visited_on reykjavik day_4)
      (visited_on reykjavik day_5)
      (visited_on reykjavik day_6)

      (visited_on porto day_9)
      (visited_on porto day_10)

      (visited_on milan day_7)
      (visited_on milan day_8)
      (visited_on milan day_9)
      (visited_on milan day_10)
    )
  )
)