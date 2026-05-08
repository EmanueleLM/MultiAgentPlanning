(define (problem visit_europe)
  (:domain city_visit)

  (:objects
    dubrovnik berlin munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (at berlin day1)
    (has_direct_flight munich dubrovnik)
    (has_direct_flight dubrovnik munich)
    (has_direct_flight berlin munich)
    (conference_day day1)
    (conference_day day4)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
  )

  (:goal (and
    (visited dubrovnik)
    (visited berlin)
    (visited munich)
    (at berlin day4)
    (at berlin day1)
  ))
)