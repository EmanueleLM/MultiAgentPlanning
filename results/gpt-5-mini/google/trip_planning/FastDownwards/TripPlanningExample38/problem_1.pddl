(define (problem trip_instance)
  (:domain trip_planning_instance)
  (:objects
    geneva madrid venice - city
    day1 day2 day3 day4 day5 - slot
  )

  (:init
    ;; direct flight connectivity (bidirectional links provided explicitly)
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
    ;; hard constraints preserved:
    ;; conference on day4 and day5 in venice (two Venice days)
    (at day4 venice)
    (at day5 venice)

    ;; plan to spend 2 days in geneva (choose day1 and day2 here to make the instance specific and feasible)
    (at day1 geneva)
    (at day2 geneva)

    ;; ensure Madrid is visited on the remaining day
    (at day3 madrid)
  ))
)