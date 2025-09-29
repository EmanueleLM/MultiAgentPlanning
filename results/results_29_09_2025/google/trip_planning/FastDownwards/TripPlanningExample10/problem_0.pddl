(define (problem trip-problem) 
  (:domain trip)

  ;; Comments / minimal assumptions (explicitly documented):
  ;; 1) The public/global constraint "3 cities for 9 days total" is treated as fixed.
  ;; 2) The explicit city-duration requests sum to 11 days (Oslo 3 + Dublin 3 + Valencia 5) which conflicts with the 9-day total.
  ;;    To produce a feasible plan that respects the global 9-day limit and the direct-flight connectivity,
  ;;    we make one minimal, explicit assumption: reduce Valencia stay to 3 days (earliest feasible adjustment).
  ;;    This yields Oslo 3 + Dublin 3 + Valencia 3 = 9 days total.
  ;;    This assumption is documented as a hard choice here so the planner yields a valid schedule.
  ;; 3) We also assume the traveller starts in Oslo on day1 (Oslo planner manages Oslo and prefers earliest feasible),
  ;;    which is the earliest feasible placement for the Oslo 3-day block.
  ;; 4) Relatives visit in Valencia must occur between day5 and day9 (inclusive). In the schedule below the Valencia block is days 7-9,
  ;;    satisfying the relatives-visit window requirement.

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; day succession
    (next day1 day2) (next day2 day3) (next day3 day4)
    (next day4 day5) (next day5 day6) (next day6 day7)
    (next day7 day8) (next day8 day9)

    ;; direct flight connections (symmetric entries for both directions)
    (direct oslo dublin) (direct dublin oslo)
    (direct dublin valencia) (direct valencia dublin)

    ;; initial location: start in Oslo on day1 (assumption documented above)
    (at oslo day1)
  )

  ;; Goals:
  ;; - Spend 3 days in each city (Oslo/Dublin/Valencia) across the 9-day trip.
  ;; - The Valencia presence on day7 (and days 7-9) satisfies the relatives-visit window (day5..day9).
  (:goal
    (and
      ;; Oslo: days 1-3
      (at oslo day1) (at oslo day2) (at oslo day3)

      ;; Dublin: days 4-6
      (at dublin day4) (at dublin day5) (at dublin day6)

      ;; Valencia: days 7-9 (assumed reduced to 3 days to fit total 9 days)
      (at valencia day7) (at valencia day8) (at valencia day9)

      ;; Relatives visit constraint (explicit): at least one presence in Valencia between day5 and day9.
      ;; This is satisfied by being in Valencia on day7 (already required above).
      (at valencia day7)
    )
  )
)