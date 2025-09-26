(define (problem eu_trip_problem) 
  (:domain eu_trip)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions / notes (explicitly documented):
  ; - Public/global constraint: total trip length = 9 days.
  ; - Oslo requested 3 days and Valencia requested 5 days; these sum to 8 days.
  ; - To satisfy the 9-day total while preserving Oslo=3 and Valencia=5 (and
  ;   to ensure Valencia occurs within the relatives window day5..day9),
  ;   we make the minimal explicit assumption: Dublin's stay is shortened
  ;   to 1 day (day 4). This contradicts dublin_planner's private 3-day
  ;   preference; the contraction is documented and intentional to resolve
  ;   the inconsistency between per-city durations and the 9-day global total.
  ; - Sequence chosen (earliest feasible satisfying all hard constraints):
  ;   Oslo days 1-3, Dublin day 4 (single transit day), Valencia days 5-9.
  ; - Only direct flights are allowed; links encoded accordingly (no direct
  ;   Oslo <-> Valencia link).
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; day succession relations
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; direct-flight connectivity (only provided links)
    (link oslo dublin)
    (link dublin oslo)
    (link dublin valencia)
    (link valencia dublin)

    ;; start: earliest feasible placement -> start in Oslo on day1
    (at oslo day1)
  )

  ;; Goal: explicit day-by-day occupancy to enforce exact durations and relatives window.
  ;; - Oslo: days 1,2,3 (3 days)
  ;; - Dublin: day 4 (1 day)  <-- explicit minimal assumption to meet 9-day total
  ;; - Valencia: days 5,6,7,8,9 (5 days) and thus relatives visit falls within day5..day9
  (:goal (and
    (at oslo day1)
    (at oslo day2)
    (at oslo day3)

    (at dublin day4)

    (at valencia day5)
    (at valencia day6)
    (at valencia day7)
    (at valencia day8)
    (at valencia day9)
  ))
)