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

    ;; available direct flights (bidirectional as given)
    (flight paris istanbul) (flight istanbul paris)
    (flight istanbul salzburg) (flight salzburg istanbul)

    ;; starting location: in Paris on day1 (day1 is already assigned)
    (at paris day1)
    (assigned day1)
  )

  ;; Goals (hard constraints from the specification preserved exactly):
  ;; - Attend conference in Paris on day1 and day2 (must be in Paris those days)
  ;; - Spend five days in Salzburg (days 3..7)
  ;; Note: The combination of these hard constraints and the provided direct-flight connectivity
  ;; makes the instance impossible (no direct Paris<->Salzburg flight and only overnight moves allowed).
  (:goal (and
    (at paris day1)
    (at paris day2)

    (at salzburg day3)
    (at salzburg day4)
    (at salzburg day5)
    (at salzburg day6)
    (at salzburg day7)
  ))
)