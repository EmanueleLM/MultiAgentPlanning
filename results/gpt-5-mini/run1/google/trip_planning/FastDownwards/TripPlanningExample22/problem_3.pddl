(define (problem trip_planning_problem22)
  (:domain trip_planning_domain22)
  (:objects
    berlin frankfurt bucharest - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )
  (:init
    ;; Calendar ordering
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)

    ;; Designate the only allowed start day
    (first_day day_1)

    ;; Direct flight connectivity (symmetric edges explicitly listed)
    (direct_flight berlin frankfurt)
    (direct_flight frankfurt berlin)
    (direct_flight frankfurt bucharest)
    (direct_flight bucharest frankfurt)
  )

  ;; Required itinerary (total 11 days). Berlin required days 1..7 to allow attending the show;
  ;; remaining days allocated to the other cities while respecting direct-flight-only moves.
  (:goal (and
    (at berlin day_1) (at berlin day_2) (at berlin day_3) (at berlin day_4)
    (at berlin day_5) (at berlin day_6) (at berlin day_7)
    (at frankfurt day_8) (at frankfurt day_9)
    (at bucharest day_10) (at bucharest day_11)
  ))
)