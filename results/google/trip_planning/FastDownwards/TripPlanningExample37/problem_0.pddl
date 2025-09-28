(define (problem travel-itinerary)
  (:domain multiagent-travel)

  ; Problem comment:
  ; The traveler requested a 10-day itinerary visiting Reykjavik, Milan, and Porto,
  ; with mandatory attendance at the Porto show on days 9 and 10. No explicit day-by-day
  ; allocations were provided that exceed the 10-day limit, so the planner is constrained
  ; to the earliest feasible schedule that ensures presence in Porto on days 9 and 10.

  (:objects
    traveler1 - agent
    reykjavik milan porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; type instances
    (agent traveler1)
    (city reykjavik) (city milan) (city porto)
    (day day1) (day day2) (day day3) (day day4) (day day5)
    (day day6) (day day7) (day day8) (day day9) (day day10)

    ;; day succession (explicit next relation for temporal steps)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; initial location: traveler starts in Reykjavik on day1
    (at traveler1 reykjavik day1)
    (visited traveler1 reykjavik)

    ;; Direct flight facts provided by the flight planner (only these direct flights are usable)
    ;; These are the explicit direct flight facts integrated into the problem.
    (direct reykjavik milan)
    (direct milan porto)

    ;; Porto show constraints (fixed event dates that must be attended)
    (show porto day9)
    (show porto day10)
  )

  ;; Goal: visit all three cities at least once and be in Porto on days 9 and 10
  (:goal (and
           (visited traveler1 reykjavik)
           (visited traveler1 milan)
           (visited traveler1 porto)
           (at traveler1 porto day9)
           (at traveler1 porto day10)
         )
  )
)