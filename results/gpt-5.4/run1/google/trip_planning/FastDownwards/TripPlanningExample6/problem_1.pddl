(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    berlin munich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)

    (final_day day8)

    (direct munich dubrovnik)
    (direct dubrovnik munich)
    (direct berlin munich)
    (direct munich berlin)

    (current_day day1)

    (berlin_count_0)
    (munich_count_0)
    (dubrovnik_count_0)
  )

  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)
      (at_day day1 berlin)
      (at_day day4 berlin)
      (berlin_count_4)
      (munich_count_3)
      (dubrovnik_count_3)
    )
  )
)