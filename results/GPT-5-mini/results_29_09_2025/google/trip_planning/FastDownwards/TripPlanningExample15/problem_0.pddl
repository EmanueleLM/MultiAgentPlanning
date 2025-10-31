(define (problem travel-problem)
  (:domain travel-domain)

  ;; Assumptions and resolution of inconsistency (documented as comments):
  ;;; ASSUMPTIONS MADE TO RESOLVE INPUT INCONSISTENCIES:
  ;;; 1) The traveler's requested stay durations sum to 13 days (Berlin 6 + Porto 2 + Krakow 5 = 13).
  ;;;    This conflicts with the provided "Total trip duration is 11 days". To produce a feasible plan
  ;;;    that respects the traveler's hard constraints (stay durations and wedding attendance), I assume
  ;;;    the total trip duration must be 13 days. Therefore days are numbered day1..day13.
  ;;; 2) To allow reaching Porto on the required wedding day while respecting only-direct-flights
  ;;;    (where Krakow and Porto have no direct connection), I allow chaining multiple direct flight legs
  ;;;    within the same calendar day (e.g., Krakow -> Berlin -> Porto within one day) by using the
  ;;;    fly_same_day_traveler action that permits multiple direct legs per day. Each leg used is a direct flight,
  ;;;    so the "direct flights only" constraint is preserved per leg.
  ;;; 3) I assume the traveler starts the trip in Berlin on day1 (earliest feasible start) to follow the
  ;;;    instruction to prefer the earliest feasible schedule.
  ;;; These assumptions are necessary because the provided constraints are otherwise unsatisfiable.
  ;;; They are encoded above and should be reviewed.

  (:objects
    traveler - agent
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ;; successor (next day) relations
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)

    ;; direct flight connectivity (shared authoritative flight_db info)
    ;; Known direct connections: Berlin <-> Porto, Krakow <-> Berlin.
    ;; We model them as bidirectional direct predicates.
    (direct berlin porto) (direct porto berlin)
    (direct krakow berlin) (direct berlin krakow)

    ;; Initial location assumption: traveler starts in Berlin on day1 (assumption documented above)
    (at traveler berlin day1)
  )

  ;; GOAL: enforce presence in each city for the required number of days and the wedding constraint.
  ;; Because counts are hard constraints and to make the problem decidable for the planner, we state the
  ;; required presence per day explicitly (earliest feasible contiguous plan under the assumptions):
  ;; - Berlin: days 1..6 (6 days)
  ;; - Krakow: days 7..9 (3 days) and days 12..13 (2 days) -> total 5 days
  ;; - Porto: days 10..11 (2 days), must include day10 for wedding
  (:goal
    (and
      ;; Berlin days 1-6
      (at traveler berlin day1)
      (at traveler berlin day2)
      (at traveler berlin day3)
      (at traveler berlin day4)
      (at traveler berlin day5)
      (at traveler berlin day6)

      ;; Krakow days 7-9 and 12-13 (total 5 days)
      (at traveler krakow day7)
      (at traveler krakow day8)
      (at traveler krakow day9)
      (at traveler krakow day12)
      (at traveler krakow day13)

      ;; Porto days 10-11 (attend wedding between day10 and day11; being in Porto on day10 satisfies this)
      (at traveler porto day10)
      (at traveler porto day11)
    )
  )

  (:metric minimize (total-cost)) ; placeholder: FastDownward will ignore if not using costs, kept for compatibility
)