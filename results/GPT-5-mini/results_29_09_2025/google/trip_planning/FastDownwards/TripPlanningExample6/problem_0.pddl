(define (problem trip-8days)
  (:domain travel-domain)
  (:objects
    traveler fm - agent
    home paris amsterdam berlin - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    ;; initial location at day0 (pre-trip baseline); trip days are day1..day8
    (at traveler home day0)

    ;; Flight manager connectivity (direct flights only). These are the only allowed moves.
    (flight home paris)
    (flight paris amsterdam)
    (flight amsterdam berlin)
    (flight berlin home)
    ;; additional direct options provided by the manager (kept explicit)
    (flight paris berlin)
    (flight home berlin)

    ;; Day succession (discrete time steps). Actions transition from di to di+1.
    (next day0 day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
  )

  (:goal (and
    ;; Traveler's preferences treated as strict temporal constraints (hard)
    ;; Visiting durations: 2 days in Paris (earliest possible)
    (at traveler paris day1)
    (at traveler paris day2)

    ;; 1 day in Amsterdam (earliest available after Paris)
    (at traveler amsterdam day3)

    ;; Conference attendance (mandatory) in Berlin on specific days
    (at traveler berlin day4)
    (at traveler berlin day5)
  ))
)