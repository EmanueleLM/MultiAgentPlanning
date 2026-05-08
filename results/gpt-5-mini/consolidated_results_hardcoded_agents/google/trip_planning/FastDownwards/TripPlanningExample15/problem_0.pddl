(define (problem trip-berlin-porto-krakow)
  (:domain travel-domain)
  ;; Assumptions and important notes:
  ;; - ASSUMPTION: Traveler starts in Berlin on day1 (explicitly set in :init).
  ;; - CONTRADICTION FLAG: Requested stay durations sum to 13 days (Berlin 6 + Porto 2 + Krakow 5), but trip horizon is 11 days.
  ;;   Per instructions, this over-subscription is flagged instead of silently shortening stays.
  ;; - Wedding interpretation: "between day 10 and day 11" has been modelled as requiring presence in Porto on both day10 and day11
  ;;   to enforce strict attendance; this contributes to the contradiction with Krakow's requested 5 days.
  ;; - Only direct flights listed in :init are available; multi-hop travel must be represented as sequences of direct flights.
  ;; - Days are discrete objects day1..day11 (start_day = day1).
  ;; Because of the conflicting stay requirements, the goal set is expected to be unsatisfiable.
  (:objects
    traveler - person
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Direct flight connectivity (only these direct connections are available)
    (direct berlin porto)
    (direct porto berlin)
    (direct krakow berlin)
    (direct berlin krakow)

    ;; Day succession (discrete time steps)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; Start state: traveler is in Berlin on day1
    (at traveler berlin day1)
    (occupied traveler day1)
  )

  ;; Goals encode the requested stays as strict constraints (these are intentionally contradictory
  ;; with the total horizon; left explicit per instructions).
  ;; - Berlin: 6 days -> day1..day6
  ;; - Porto: 2 days -> day10..day11 (includes wedding days)
  ;; - Krakow: 5 days -> day7..day11
  (:goal (and
    ;; Berlin 6 days
    (at traveler berlin day1)
    (at traveler berlin day2)
    (at traveler berlin day3)
    (at traveler berlin day4)
    (at traveler berlin day5)
    (at traveler berlin day6)

    ;; Porto 2 days (wedding attendance between day10 and day11 enforced)
    (at traveler porto day10)
    (at traveler porto day11)

    ;; Krakow 5 days
    (at traveler krakow day7)
    (at traveler krakow day8)
    (at traveler krakow day9)
    (at traveler krakow day10)
    (at traveler krakow day11)
  ))

  ;; No metric specified; the planner will attempt to satisfy the hard constraints.
)