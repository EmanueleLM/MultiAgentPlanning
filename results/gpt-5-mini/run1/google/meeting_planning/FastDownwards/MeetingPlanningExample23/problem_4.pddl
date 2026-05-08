(define (problem meeting_planning23_problem)
  (:domain meeting_planning23)

  (:objects
    traveler john - agent
    bayview russian_hill - location

    t0900 t1707 t1730 t1737 t1800 t1845 t1908 t1915 t1938 t1922 t1945 t2100 t2123 - time

    flag1 - flag
  )

  (:init
    ;; initial location/time
    (traveler_at traveler bayview t0900)

    ;; John's availability window (17:30 - 21:00)
    (john_available t1730 t2100)

    ;; Enumerated travel legs (grounded departures/arrivals consistent with 23 minute travel time)
    (travel_leg bayview russian_hill t1707 t1730)
    (travel_leg bayview russian_hill t1737 t1800)
    (travel_leg bayview russian_hill t1922 t1945)

    (travel_leg russian_hill bayview t1845 t1908)
    (travel_leg russian_hill bayview t1915 t1938)
    (travel_leg russian_hill bayview t2100 t2123)
  )

  (:goal (and
    (chosen flag1)
    (met_at_least_75)
  ))
)