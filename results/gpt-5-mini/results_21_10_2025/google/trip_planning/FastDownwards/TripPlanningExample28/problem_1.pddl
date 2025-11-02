(define (problem trip-verify-12days)
  (:domain trip-scheduling-fd)
  (:objects
    venice florence zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ;; day successor chain for 12 day transitions (day1 -> day13 is 12 advances)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)

    ;; start at day1
    (current-day day1)

    ;; start location: Venice (feasible for the available flights)
    (at venice)

    ;; initial counters: zero for each city
    (v-count-0) (f-count-0) (z-count-0)

    ;; Note: other count atoms are false implicitly under STRIPS semantics.
  )

  ;; Goal: consume all 12 days (i.e., current-day = day13).
  ;; The domain's limited per-city stay capacities (Venice up to 5, Florence up to 5, Zurich up to 2)
  ;; sum to exactly 12; because the only way to advance the day is via stay actions,
  ;; any plan that reaches day13 must use exactly 5 Venice stays, 2 Zurich stays and 5 Florence stays
  ;; and must use only available direct flights to move between cities. The goal thus verifies
  ;; feasibility of the proposed schedule without explicitly naming the distribution.
  (:goal
    (and
      (current-day day13)
    )
  )
)