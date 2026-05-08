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

    (conference_day day1)
    (conference_day day4)

    (need_berlin)
    (need_munich)
    (need_dubrovnik)

    (need_day2_berlin)
    (need_day3_berlin)
    (need_day5_berlin)
    (need_day6_berlin)

    (need_day2_munich)
    (need_day3_munich)
    (need_day5_munich)

    (need_day6_dubrovnik)
    (need_day7_dubrovnik)
    (need_day8_dubrovnik)
  )

  (:goal
    (and
      (visited_on day1 berlin)
      (visited_on day4 berlin)

      (visited_on day2 berlin)
      (visited_on day3 berlin)
      (visited_on day5 berlin)
      (visited_on day6 berlin)

      (visited_on day2 munich)
      (visited_on day3 munich)
      (visited_on day5 munich)

      (visited_on day6 dubrovnik)
      (visited_on day7 dubrovnik)
      (visited_on day8 dubrovnik)

      (not (current_day day1))
      (not (current_day day2))
      (not (current_day day3))
      (not (current_day day4))
      (not (current_day day5))
      (not (current_day day6))
      (not (current_day day7))
      (not (current_day day8))
    )
  )
)