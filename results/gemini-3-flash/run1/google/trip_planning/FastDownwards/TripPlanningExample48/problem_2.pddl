(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    manchester split geneva - city
    day_1 day_2 day_3 day_4 - day
  )

  (:init
    ;; Timeline
    (first_day day_1)
    (final_day day_4)
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)

    ;; Flight connections
    ;; Split and Geneva (Split <-> Geneva)
    (flight split geneva)
    (flight geneva split)
    ;; from Manchester to Split (Manchester -> Split)
    (flight manchester split)
    ;; Manchester and Geneva (Manchester <-> Geneva)
    (flight manchester geneva)
    (flight geneva manchester)
  )

  (:goal
    (and
      ;; The trip must last for 4 days
      (trip_finished)

      ;; Meet a friend in Split between day 2 and day 3
      (at split day_2)
      (at split day_3)

      ;; Visit Split for at least 2 days
      (visited_2_days split)

      ;; Stay in Manchester for at least 2 days
      (visited_2_days manchester)

      ;; Visit Geneva for at least 2 days
      (visited_2_days geneva)
    )
  )
)