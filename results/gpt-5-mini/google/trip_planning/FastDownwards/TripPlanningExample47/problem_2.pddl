(define (problem trip_instance)
  (:domain trip_planning)
  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )
  (:init
    ;; day ordering
    (next day1 day2) (next day2 day3) (next day3 day4)
    (next day4 day5) (next day5 day6) (next day6 day7)

    ;; available direct flights (bidirectional)
    (flight paris istanbul) (flight istanbul paris)
    (flight istanbul salzburg) (flight salzburg istanbul)

    ;; starting location and first day assigned
    (at paris day1)
    (assigned day1)
  )
  (:goal (and
    ;; hard conference constraint: be in Paris on day1 and day2
    (at paris day1)
    (at paris day2)

    ;; hard stay requirement: spend 5 days in Salzburg (days 3-7)
    (at salzburg day3)
    (at salzburg day4)
    (at salzburg day5)
    (at salzburg day6)
    (at salzburg day7)
  ))
)