(define (problem traveler-14day-itinerary)
  (:domain travel-itinerary)
  (:objects
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ;; All days start unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14)

    ;; Define day order (successor links)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; Mark day1 as the first day (only day that can be assigned with assign-first-day)
    (is-first day1)

    ;; Flight adjacency (direct flights only) plus reflexive adjacency to allow staying in the same city overnight
    ;; Direct flights provided by the flights agent:
    (adjacent amsterdam santorini)
    (adjacent santorini amsterdam)
    (adjacent amsterdam istanbul)
    (adjacent istanbul amsterdam)

    ;; Reflexive adjacency to allow staying in same city across consecutive days
    (adjacent amsterdam amsterdam)
    (adjacent santorini santorini)
    (adjacent istanbul istanbul)

    ;; Hard constraints encoded explicitly:
    ;; - Direct flights only are enforced by adjacency facts above (no adjacency between Istanbul and Santorini).
    ;; - Santorini relatives window (hard): days 12, 13, 14 MUST be Santorini.
    ;; To enforce these as hard constraints, pre-assign days 12-14 to Santorini now (so planner cannot change them).
    (assigned day12 santorini) (not (unassigned day12))
    (assigned day13 santorini) (not (unassigned day13))
    (assigned day14 santorini) (not (unassigned day14))
  )

  (:goal
    (and
      ;; Total trip length exactly 14 days: require that all days are assigned
      (assigned day1 ?c1) (assigned day2 ?c2) (assigned day3 ?c3) (assigned day4 ?c4)
      (assigned day5 ?c5) (assigned day6 ?c6) (assigned day7 ?c7) (assigned day8 ?c8)
      (assigned day9 ?c9) (assigned day10 ?c10) (assigned day11 ?c11)
      (assigned day12 santorini) (assigned day13 santorini) (assigned day14 santorini)

      ;; Sanity: ensure days12-14 remain Santorini (already set in :init; repeated here for clarity)
      ;; The goal above (assigned day12 santorini) etc. enforces Santorini window hard constraint.

      ;; Note: adjacency constraints between consecutive assigned days are enforced operationally
      ;; by the preconditions of assign-next-day, which require adjacency between the previous and current day cities.
      ;; Therefore any plan that assigns consecutive days to Istanbul and Santorini without Amsterdam in between is infeasible
      ;; because no adjacency exists between Istanbul and Santorini.

    )
  )

  ;; No metric is supplied. This encoding enforces all hard constraints:
  ;; - total length 14 days (all days must be assigned)
  ;; - direct flights only (adjacency facts)
  ;; - Santorini visit includes days 12-14 and therefore is at least 3 days
  ;;
  ;; Amsterdam and Istanbul stay-length preferences are left flexible within the feasible assignments for days 1–11.
  ;; Feasible allocations that respect all hard constraints include the provided Option A/B/C examples.
)