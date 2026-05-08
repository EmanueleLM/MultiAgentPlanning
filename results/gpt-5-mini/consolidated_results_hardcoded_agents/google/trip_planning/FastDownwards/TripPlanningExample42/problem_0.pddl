; Problem: Integrated 11-day trip plan
; Conflict resolution notes (documenting reconciliation choices):
; - Individual hard constraints from planners:
;     planner_paris: stay 4 days in Paris (days 1-4) and meet friends between day1 and day4 (hard).
;     planner_mykonos: stay 4 days in Mykonos (hard).
;     planner_nice: stay 5 days in Nice (hard).
; - The public total-trip duration is 11 days. The sum of requested stays (4 + 5 + 4 = 13) exceeds 11.
; - This is a direct contradiction across hard constraints. To produce a feasible plan of exactly 11 days
;   while respecting key constraints and available direct flights (Paris <-> Nice, Nice <-> Mykonos),
;   the following reconciliation is applied (documented as a required decision):
;     * Prioritise planner_paris's 4-day Paris stay (days 1-4) including the meeting.
;     * Prioritise planner_mykonos's 4-day Mykonos stay (days 8-11).
;     * Reduce planner_nice's stay to the remaining 3 days (days 5-7) so total days = 11.
; - The reduction of planner_nice's requested 5 days to 3 days is a forced relaxation due to the global 11-day limit.
;   This conflict is flagged here; the generated plan implements the described resolution.
; - Meeting with friends is scheduled on day1 (the earliest feasible day in the requested window day1-day4).
; - All travel uses only available direct flights:
;     Paris -> Nice (used on transition day4->day5)
;     Nice  -> Mykonos (used on transition day7->day8)
; - No other flights or multi-hop implicit routes are introduced.

(define (problem trip11)
  (:domain multiagent-travel)
  (:objects
    paris nice mykonos - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Trip starts in Paris on day1 (arrival window satisfied at earliest day).
    (at paris day1)
  )

  (:goal
    (and
      ;; Paris: planner_paris hard requirement for 4 days (days 1-4)
      (at paris day1)
      (at paris day2)
      (at paris day3)
      (at paris day4)

      ;; Nice: reconciled to 3 days (days 5-7) due to total-day constraint
      (at nice day5)
      (at nice day6)
      (at nice day7)

      ;; Mykonos: planner_mykonos hard requirement for 4 days (days 8-11)
      (at mykonos day8)
      (at mykonos day9)
      (at mykonos day10)
      (at mykonos day11)

      ;; Meeting with friends (planner_paris preference treated as hard): earliest feasible on day1
      (met-friends)
    )
  )
)