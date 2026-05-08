(define (problem visit_europe)
  (:domain city_trip_planning)

  (:objects
    dubrovnik berlin munich - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (current_city berlin)
    (has_direct_flight munich dubrovnik)
    (has_direct_flight dubrovnik munich)
    (has_direct_flight munich berlin)
    (has_direct_flight berlin munich)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
  )

  (:goal (and
    (current_city berlin)
    (stayed berlin day1)
    (stayed berlin day2)
    (stayed berlin day3)
    (stayed berlin day4)
    (stayed munich day5)
    (stayed münich day6)
    (stayed munich day7)
    (stayed dubrovnik day8)
  ))
)