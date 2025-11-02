(define (problem trip-16days)
  (:domain trip-planning)
  (:objects
    lisbon florence copenhagen - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; direct-flight graph (only direct flights allowed; reflexive direct edges allow staying)
    ;; Given service information:
    ;; - direct between Copenhagen <-> Lisbon
    ;; - direct between Lisbon <-> Florence
    ;; - NO direct between Copenhagen and Florence
    (direct copenhagen lisbon)
    (direct lisbon copenhagen)
    (direct lisbon florence)
    (direct florence lisbon)

    ;; reflexive links to allow "stay in same city" between consecutive days
    (direct lisbon lisbon)
    (direct florence florence)
    (direct copenhagen copenhagen)

    ;; temporal ordering of days
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    ;; Unassigned status: all days except day1 start unassigned (we will build forward from day1).
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
    (unassigned day9)
    (unassigned day10)
    (unassigned day11)
    (unassigned day12)
    (unassigned day13)
    (unassigned day14)
    (unassigned day15)
    (unassigned day16)

    ;; Initial presence: conference requirement mandates being in Copenhagen on day1.
    ;; We seed day1 as already assigned to Copenhagen. This also initializes days-in copenhagen = 1.
    (at copenhagen day1)

    ;; Initialize numeric day counters:
    (= (days-in lisbon) 0)
    (= (days-in florence) 0)
    (= (days-in copenhagen) 1)
  )

  ;; Goals:
  ;; - Every day must be assigned (i.e., no unassigned days remain).
  ;; - Must attend conferences in Copenhagen on day1 and day7.
  ;; - Stay counts per city must not exceed the traveler's requested stays (treated as upper bounds
  ;;   because exact requested totals are inconsistent with total trip length).
  ;; - Total allocated days must equal 16 (redundant if all days assigned; included for clarity).
  (:goal
    (and
      ;; Conference attendance hard constraints:
      (at copenhagen day1)
      (at copenhagen day7)

      ;; All days assigned to some city (no unassigned days). Here we explicitly negate unassigned for days 2..16.
      (not (unassigned day2))
      (not (unassigned day3))
      (not (unassigned day4))
      (not (unassigned day5))
      (not (unassigned day6))
      (not (unassigned day7))
      (not (unassigned day8))
      (not (unassigned day9))
      (not (unassigned day10))
      (not (unassigned day11))
      (not (unassigned day12))
      (not (unassigned day13))
      (not (unassigned day14))
      (not (unassigned day15))
      (not (unassigned day16))

      ;; Upper bounds from traveler requests (because the requested exact totals are inconsistent).
      ;; These are treated as hard constraints here (the planner must not exceed requested days).
      (<= (days-in lisbon) 7)
      (<= (days-in florence) 4)
      (<= (days-in copenhagen) 7)

      ;; Total days sum constraint: sum of days-in cities must equal the total trip length.
      (= (+ (days-in lisbon) (days-in florence) (days-in copenhagen)) 16)
    )
  )

  ;; Additional commentary for users and planners (not processed by the planner):
  ;; - The traveler requested exact stays that total 18 days (Lisbon 7 + Florence 4 + Copenhagen 7),
  ;;   exceeding the trip length of 16 days by 2 days. To resolve this inconsistency:
  ;;   * This PDDL encodes the request as upper bounds (<=) so the planner can reduce stays to fit 16 days.
  ;;   * The planner is free to allocate the two days reduction across cities as needed, subject to direct-flight
  ;;     connectivity and conference presence on day1 and day7.
  ;; - Commutes are only permitted on day boundaries and only between cities with a (direct ...) predicate.
  ;; - Because there is no direct Copenhagen <-> Florence link, any move between these must pass through Lisbon
  ;;   on some intermediate day (i.e., Copenhagen -> Lisbon -> Florence).
)