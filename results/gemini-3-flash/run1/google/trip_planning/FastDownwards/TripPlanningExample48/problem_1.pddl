(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    manchester split geneva - city
    day_1 day_2 day_3 day_4 - day
  )

  (:init
    ;; Time structure
    (first_day day_1)
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)

    ;; Flights
    ;; Split and Geneva (Split <-> Geneva)
    (flight split geneva)
    (flight geneva split)
    ;; From Manchester to Split (Manchester -> Split)
    (flight manchester split)
    ;; Manchester and Geneva (Manchester <-> Geneva)
    (flight manchester geneva)
    (flight geneva manchester)
  )

  (:goal
    (and
      ;; Finish the 4-day trip
      (current_day day_4)

      ;; Meet a friend in Split between day 2 and day 3
      (at split day_2)
      (at split day_3)

      ;; Visit Split for 2 days
      ;; (Satisfied by friend constraint, but included for completeness)
      (or (and (at split day_1) (at split day_2))
          (and (at split day_1) (at split day_3))
          (and (at split day_1) (at split day_4))
          (and (at split day_2) (at split day_3))
          (and (at split day_2) (at split day_4))
          (and (at split day_3) (at split day_4))
      )

      ;; Stay in Manchester for 2 days
      (or (and (at manchester day_1) (at manchester day_2))
          (and (at manchester day_1) (at manchester day_3))
          (and (at manchester day_1) (at manchester day_4))
          (and (at manchester day_2) (at manchester day_3))
          (and (at manchester day_2) (at manchester day_4))
          (and (at manchester day_3) (at manchester day_4))
      )

      ;; Visit Geneva for 2 days
      (or (and (at geneva day_1) (at geneva day_2))
          (and (at geneva day_1) (at geneva day_3))
          (and (at geneva day_1) (at geneva day_4))
          (and (at geneva day_2) (at geneva day_3))
          (and (at geneva day_2) (at geneva day_4))
          (and (at geneva day_3) (at geneva day_4))
      )
    )
  )
)