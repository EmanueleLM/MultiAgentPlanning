(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (current_day day1)
    (last_day day9)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (direct oslo dublin)
    (direct dublin oslo)
    (direct dublin valencia)
    (direct valencia dublin)

    (window_day day5)
    (window_day day6)
    (window_day day7)
    (window_day day8)
    (window_day day9)

    (required day1 oslo)
    (required day2 oslo)
    (required day3 oslo)
    (required day4 dublin)
    (required day5 dublin)
    (required day6 dublin)
    (required day7 valencia)
    (required day8 valencia)
    (required day9 valencia)
  )

  (:goal
    (and
      (trip_complete)
      (spent day1 oslo)
      (spent day2 oslo)
      (spent day3 oslo)
      (spent day4 dublin)
      (spent day5 dublin)
      (spent day6 dublin)
      (spent day7 valencia)
      (spent day8 valencia)
      (spent day9 valencia)
      (window_satisfied)
    )
  )
)