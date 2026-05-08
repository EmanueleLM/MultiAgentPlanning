(define (problem trip_instance)
  (:domain trip_planning_instance)
  (:objects
    geneva madrid venice - city
    day1 day2 day3 day4 day5 - slot
  )

  (:init
    ;; direct flight connectivity (explicit, directed links; reverse directions included where available)
    (connected geneva madrid)
    (connected madrid geneva)
    (connected madrid venice)
    (connected venice madrid)

    ;; temporal ordering of slots (days)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)

    ;; mark the initial slot
    (is_first day1)
  )

  (:goal (and
    ;; conference: day4 and day5 must be in venice (Venice for days 4 and 5)
    (at day4 venice)
    (at day5 venice)

    ;; spend 2 days in geneva (here required on day1 and day2)
    (at day1 geneva)
    (at day2 geneva)

    ;; visit madrid on the remaining day (day3)
    (at day3 madrid)
  ))
)