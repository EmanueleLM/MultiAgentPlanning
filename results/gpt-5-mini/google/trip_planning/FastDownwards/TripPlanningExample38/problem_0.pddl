(define (problem trip_instance)
  (:domain jack_of_all_trades_trip)
  (:objects
    geneva madrid venice - city
    day1 day2 day3 day4 day5 - day
  )
  (:init
    ;; connectivity (direct flights)
    (connected geneva madrid)
    (connected madrid geneva)
    (connected madrid venice)
    (connected venice madrid)

    ;; day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
  )
  (:goal (and
    ;; hard constraints encoded exactly as specified
    (at day1 geneva)
    (at day2 geneva)
    (at day1 madrid)
    (at day2 madrid)
    (at day3 madrid)
    (at day4 venice)
    (at day5 venice)
  ))
)