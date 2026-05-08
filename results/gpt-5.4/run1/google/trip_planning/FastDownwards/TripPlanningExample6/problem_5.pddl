(define (problem trip_planning_example6_problem)
  (:domain trip_planning_example6)

  (:objects
    berlin munich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (direct berlin munich)
    (direct munich berlin)
    (direct munich dubrovnik)
    (direct dubrovnik munich)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (last_day day8)

    (current_day day1)
    (at berlin)

    (required_city day1 berlin)
    (required_city day2 berlin)
    (required_city day3 munich)
    (required_city day4 berlin)
    (required_city day5 munich)
    (required_city day6 dubrovnik)
    (required_city day7 dubrovnik)
    (required_city day8 dubrovnik)
  )

  (:goal
    (and
      (not (current_day day1))
      (not (current_day day2))
      (not (current_day day3))
      (not (current_day day4))
      (not (current_day day5))
      (not (current_day day6))
      (not (current_day day7))
      (not (current_day day8))
      (at dubrovnik)
    )
  )
)