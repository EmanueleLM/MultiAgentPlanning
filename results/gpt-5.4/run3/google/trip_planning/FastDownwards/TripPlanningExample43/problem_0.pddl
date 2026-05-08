(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    dublin porto venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (direct dublin porto)
    (direct porto dublin)
    (direct venice dublin)
    (direct dublin venice)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    (day_free day1)
    (day_free day2)
    (day_free day3)
    (day_free day4)
    (day_free day5)
    (day_free day6)
    (day_free day7)
    (day_free day8)
    (day_free day9)
    (day_free day10)
  )

  (:goal
    (and
      (meeting_done)

      (at venice day1)
      (at venice day2)
      (at venice day3)
      (at venice day4)

      (at porto day4)
      (at porto day5)
      (at porto day6)
      (at porto day7)

      (at dublin day7)
      (at dublin day8)
      (at dublin day9)
      (at dublin day10)
    )
  )
)