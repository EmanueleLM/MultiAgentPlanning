(define (problem meeting_planning23_problem)
  (:domain meeting_planning23)

  (:objects
    traveler john - agent
    bayview russian_hill - location

    ;; discrete timepoints used to encode departures/arrivals and availability endpoints
    t0900 t1707 t1730 t1737 t1800 t1845 t1908 t1915 t1938 t1922 t1945 t2100 t2123 - time

    flag1 - flag
  )

  (:init
    ;; traveler initial location/time
    (traveler-at traveler bayview t0900)

    ;; John's availability window: 17:30 to 21:00
    (john-available t1730 t2100)

    ;; outbound travel legs (each encodes a 23-minute transit where used by schedules)
    (travel-leg bayview russian_hill t1707 t1730)  ;; depart 17:07 arrive 17:30
    (travel-leg bayview russian_hill t1737 t1800)  ;; depart 17:37 arrive 18:00
    (travel-leg bayview russian_hill t1922 t1945)  ;; depart 19:22 arrive 19:45

    ;; return travel legs (return after meetings)
    (travel-leg russian_hill bayview t1845 t1908)  ;; depart 18:45 arrive 19:08
    (travel-leg russian_hill bayview t1915 t1938)  ;; depart 19:15 arrive 19:38
    (travel-leg russian_hill bayview t2100 t2123)  ;; depart 21:00 arrive 21:23
  )

  (:goal (and
    (chosen flag1)
    (met-at-least-75)
  ))
)