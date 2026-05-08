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

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    (current_day day1)
    (at berlin)

    (remaining_berlin_4)
    (remaining_munich_3)
    (remaining_dubrovnik_3)
  )

  (:goal
    (and
      (visited day1 berlin)
      (visited day4 berlin)
      (remaining_berlin_0)
      (remaining_munich_0)
      (remaining_dubrovnik_0)
    )
  )
)