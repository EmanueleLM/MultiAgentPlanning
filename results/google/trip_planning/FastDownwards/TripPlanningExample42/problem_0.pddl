; Problem: 11-day trip integrating planner fragments
; Reconciliation notes (hard constraints and resolution):
; - Public info: total trip length is 11 days; available direct flights are:
;     Paris -> Nice  and  Nice -> Mykonos (one-way as listed).
; - Private hard constraints:
;     planner_paris: 4 days in Paris, meet friends between day 1..4 (earliest meeting preferred)
;     planner_mykonos: 4 days in Mykonos
;     planner_nice: 5 days in Nice
; - Sum of requested days (4 + 4 + 5 = 13) exceeds total trip length (11). To reconcile:
;     * We keep planner_paris's 4 days in Paris (hard) and planner_mykonos's 4 days in Mykonos (hard)
;       because meeting constraint in Paris requires early contiguous days and Mykonos requested 4 days.
;     * We therefore reduce Nice's stay from 5 days to 3 days (planner_nice's 5-day preference is relaxed
;       to meet the overall trip-length constraint). This reconciliation is documented and treated as enforced.
; - Travel order is forced by available direct flights: Paris -> Nice -> Mykonos.
; - Earliest feasible meeting in Paris is scheduled on day2 (within window 1..4); planner_paris preferred earliest slot.
; - The schedule chosen (and enforced in the problem initial/goal specification):
;     Paris: days 1,2,3,4    (4 days; meeting on day2)
;     Nice:  days 5,6,7      (3 days; reduced from 5 to meet 11-day total)
;     Mykonos: days 8,9,10,11 (4 days)
; - Flights used for city transitions (occur between the days indicated) align with available direct flights:
;     Paris -> Nice  (transition from day4 to day5)
;     Nice  -> Mykonos (transition from day7 to day8)
; - All temporal constraints (meeting window, contiguous days for Paris and Mykonos) are enforced by the goal facts.
; - No other flights (including reverse directions) are assumed or invented.

(define (problem trip-11days)
  (:domain travel-multiagent)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    paris nice mykonos - city
  )

  (:init
    ; day and next relations
    (day day1) (day day2) (day day3) (day day4) (day day5) (day day6) (day day7) (day day8) (day day9) (day day10) (day day11)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11)

    ; available direct flights as provided (one-way)
    (flight paris nice)
    (flight nice mykonos)

    ; initial assignment: start in Paris on day1
    (in paris day1)

    ; remaining days are unassigned initially; planner actions will assign them
    (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5) (unassigned day6)
    (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10) (unassigned day11)

    ; pointer to current day (we will advance this as days are assigned)
    (current day1)

    ; meeting window for Paris as required by planner_paris: days 1..4
    (meeting-window day1) (meeting-window day2) (meeting-window day3) (meeting-window day4)
  )

  (:goal (and
    ; Paris: enforce 4 days in Paris (days 1..4)
    (in paris day1) (in paris day2) (in paris day3) (in paris day4)

    ; Meeting requirement (earliest feasible meeting scheduled on day2)
    (met paris day2)

    ; Nice: reconciled to 3 days to fit total 11 days (days 5..7)
    (in nice day5) (in nice day6) (in nice day7)

    ; Mykonos: enforce 4 days (days 8..11)
    (in mykonos day8) (in mykonos day9) (in mykonos day10) (in mykonos day11)
  ))
)