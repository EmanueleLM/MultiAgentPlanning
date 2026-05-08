(define (problem europe_trip_10_days_instance_problem)
  (:domain europe_trip_10_days_instance)

  (:objects
    reykjavik milan porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)

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

    (direct reykjavik milan)
    (direct milan reykjavik)
    (direct milan porto)
    (direct porto milan)
  )

  (:goal
    (and
      (current_day day_11)

      (spent_day_in day_1 reykjavik)
      (spent_day_in day_2 reykjavik)
      (spent_day_in day_3 reykjavik)
      (spent_day_in day_4 reykjavik)
      (spent_day_in day_5 reykjavik)
      (spent_day_in day_6 reykjavik)

      (spent_day_in day_7 milan)
      (spent_day_in day_8 milan)
      (spent_day_in day_9 milan)
      (spent_day_in day_10 milan)

      (spent_day_in day_9 porto)
      (spent_day_in day_10 porto)
    )
  )
)