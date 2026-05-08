(define (problem trip-8days)
  (:domain trip-planning)
  (:objects
    London Bucharest Riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    ;; day successor relation
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8)

    ;; direct flight connections (only these may be used)
    (direct London Bucharest) (direct Bucharest London)
    (direct Bucharest Riga) (direct Riga Bucharest)

    ;; day assignment bookkeeping: start with day1 assigned at London; others free
    (assigned day1)
    (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8)

    ;; Starting location (earliest feasible arrangement consistent with planned stays)
    (at London day1)
  )

  ;; Goal encodes the reconciled stay allocation across the 8-day horizon:
  ;; - London on days 1-3 (3 days)
  ;; - Bucharest on day 4 (1 day)
  ;; - Riga on days 5-8 (4 days)
  ;; This allocation respects the direct-flight-only connectivity and ensures
  ;; the Riga workshop is attended between days 5 and 8.
  (:goal (and
    (at London day1) (at London day2) (at London day3)
    (at Bucharest day4)
    (at Riga day5) (at Riga day6) (at Riga day7) (at Riga day8)
  ))