(define (problem meeting_planning23_problem)
  (:domain meeting_planning23)

  (:objects
    traveler john - agent
    bayview russianhill - location

    ; discrete timepoints used to encode departures/arrivals and availability endpoints
    t0900 t1507 t1530 t1630 t1653 t1707 t1730 t1845 t1900 t1908 t1915 t1923 t1938 t2100 t2123 - time

    flag1 - flag
  )

  (:init
    ; traveler initial location/time
    (traveler-at traveler bayview t0900)

    ; John's availability window
    (john-available t1730 t2100)

    ; available travel legs (each encodes the 23-minute transit where used by schedules)
    (travel-leg bayview russianhill t1507 t1530)
    (travel-leg bayview russianhill t1707 t1730)
    (travel-leg bayview russianhill t1630 t1653)

    (travel-leg russianhill bayview t2100 t2123)
    (travel-leg russianhill bayview t1845 t1908)
    (travel-leg russianhill bayview t1900 t1923)
    (travel-leg russianhill bayview t1915 t1938)
  )

  (:goal (and
    (chosen flag1)
    (met-at-least-75)
  ))
)