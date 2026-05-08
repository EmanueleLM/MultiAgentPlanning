(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    seville munich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (direct seville munich)
    (direct munich seville)
    (direct munich tallinn)
    (direct tallinn munich)

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
    (next_day day_11 day_12)

    (current_day day_1)
    (at seville)
  )

  (:goal
    (and
      (visited_on day_1 seville)
      (visited_on day_2 seville)
      (visited_on day_3 seville)
      (visited_on day_4 seville)
      (visited_on day_5 seville)
      (visited_on day_6 seville)
      (visited_on day_7 seville)

      (visited_on day_8 munich)
      (visited_on day_9 munich)
      (visited_on day_10 munich)

      (visited_on day_11 tallinn)
      (visited_on day_12 tallinn)

      (friend_met)
    )
  )
)