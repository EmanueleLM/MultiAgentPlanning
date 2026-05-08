(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    berlin munich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (current_day day_1)
    (at berlin)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)

    (direct munich dubrovnik)
    (direct dubrovnik munich)
    (direct berlin munich)
    (direct munich berlin)

    (conference_day day_1)
    (conference_day day_4)
  )

  (:goal
    (and
      (visited berlin day_1)
      (visited berlin day_4)

      (visited berlin day_1)
      (visited berlin day_2)
      (visited berlin day_3)
      (visited berlin day_4)

      (visited munich day_5)
      (visited munich day_6)
      (visited munich day_7)

      (visited dubrovnik day_2)
      (visited dubrovnik day_6)
      (visited dubrovnik day_8)
    )
  )
)