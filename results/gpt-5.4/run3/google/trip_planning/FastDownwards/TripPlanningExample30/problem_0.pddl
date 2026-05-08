(define (problem european_trip_14day_instance_problem)
  (:domain european_trip_14day_instance)

  (:objects
    istanbul tallinn zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (direct istanbul tallinn)
    (direct istanbul zurich)
    (direct tallinn zurich)
    (direct tallinn istanbul)

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
    (next_day day_12 day_13)
    (next_day day_13 day_14)

    (last_day day_14)

    (assigned day_1 zurich)
    (current_day day_1)
  )

  (:goal
    (and
      (schedule_complete)

      (assigned day_1 zurich)
      (assigned day_2 zurich)
      (assigned day_3 zurich)
      (assigned day_4 zurich)
      (assigned day_5 zurich)
      (assigned day_6 zurich)
      (assigned day_7 zurich)

      (assigned day_8 zurich)
      (assigned day_9 zurich)
      (assigned day_10 tallinn)
      (assigned day_11 tallinn)
      (assigned day_12 tallinn)
      (assigned day_13 tallinn)
      (assigned day_14 istanbul)

      (assigned day_8 istanbul)
      (assigned day_9 istanbul)
      (assigned day_10 istanbul)
      (assigned day_11 istanbul)
      (assigned day_12 istanbul)
    )
  )
)