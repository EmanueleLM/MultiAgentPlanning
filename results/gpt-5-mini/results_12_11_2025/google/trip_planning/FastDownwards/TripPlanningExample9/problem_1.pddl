(define (problem TripPlanningExample9)
  (:domain trip-planning)
  (:objects
    ; Days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day

    ; Cities
    frankfurt bucharest stuttgart - city

    ; Tokens for exact counts per city: Frankfurt 3, Bucharest 3, Stuttgart 4
    f1 f2 f3 - token
    b1 b2 b3 - token
    s1 s2 s3 s4 - token
  )

  (:init
    ; successor relation for consecutive days
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    ; day unassigned initially
    (day-unassigned day1) (day-unassigned day2) (day-unassigned day3)
    (day-unassigned day4) (day-unassigned day5) (day-unassigned day6)
    (day-unassigned day7) (day-unassigned day8) (day-unassigned day9)
    (day-unassigned day10)

    ; first day marker
    (first-day day1)

    ; workshop window days (day5..day10)
    (window-day day5) (window-day day6) (window-day day7)
    (window-day day8) (window-day day9) (window-day day10)

    ; flight graph (bidirectional), plus self-loops to allow staying put
    ; Bucharest <-> Frankfurt
    (flight bucharest frankfurt) (flight frankfurt bucharest)
    ; Frankfurt <-> Stuttgart
    (flight frankfurt stuttgart) (flight stuttgart frankfurt)
    ; self-loops (staying in the same city)
    (flight bucharest bucharest) (flight frankfurt frankfurt) (flight stuttgart stuttgart)

    ; mark Stuttgart
    (is-stuttgart stuttgart)

    ; tokens availability and mapping to cities
    (token-available f1) (token-city f1 frankfurt)
    (token-available f2) (token-city f2 frankfurt)
    (token-available f3) (token-city f3 frankfurt)

    (token-available b1) (token-city b1 bucharest)
    (token-available b2) (token-city b2 bucharest)
    (token-available b3) (token-city b3 bucharest)

    (token-available s1) (token-city s1 stuttgart)
    (token-available s2) (token-city s2 stuttgart)
    (token-available s3) (token-city s3 stuttgart)
    (token-available s4) (token-city s4 stuttgart)
  )

  (:goal
    (and
      ; all days must be assigned
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
      ; must attend workshop in Stuttgart during the window (set by assignment action)
      (attended-workshop)
    )
  )
)