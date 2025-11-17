(define (problem trip-venice-zurich-florence-12days)
  (:domain trip-planning)

  (:objects
    venice zurich florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ;; Starting location (choose earliest feasible start to respect preferences)
    (at venice)

    ;; Declared direct flights (only those explicitly reported)
    (flight venice zurich)
    (flight zurich venice)
    (flight zurich florence)

    ;; All days initially free (12-day horizon)
    (day-free day1) (day-free day2) (day-free day3) (day-free day4)
    (day-free day5) (day-free day6) (day-free day7) (day-free day8)
    (day-free day9) (day-free day10) (day-free day11) (day-free day12)

    ;; NOTE: Agent-stated desired stays (treated as hard requirements in the
    ;; overall problem specification) are:
    ;;   Venice: 6 days (venice_agent, hard)
    ;;   Zurich: 2 days (public)
    ;;   Florence: 6 days (florence_agent, hard)
    ;; These desires sum to 14 > 12 and therefore are inconsistent with the 12-day horizon.
    ;; The contradiction is explicitly flagged in the header above.
  )

  ;; The goal encodes earliest feasible allocation given the 12 available days
  ;; and the available direct flights. Because the stated desires exceed the horizon,
  ;; the full original desires cannot be met; the goal below assigns the earliest
  ;; days to the reported cities (Venice first per venice_agent preference).
  ;; This goal is provided so a planner can attempt to assign the earliest days;
  ;; if the planner cannot meet all hard constraints it will report no solution.
  (:goal
    (and
      ;; Venice preferred 6 days => allocate earliest days 1..6 to Venice
      (assigned day1 venice) (assigned day2 venice) (assigned day3 venice)
      (assigned day4 venice) (assigned day5 venice) (assigned day6 venice)

      ;; Zurich required 2 days => allocate next earliest days 7..8 to Zurich
      (assigned day7 zurich) (assigned day8 zurich)

      ;; Florence requested 6 days, but only days 9..12 remain in the 12-day horizon.
      ;; Allocate the remaining 4 days 9..12 to Florence as the earliest feasible allocation.
      ;; The original Florence request of 6 days cannot be satisfied (contradiction).
      (assigned day9 florence) (assigned day10 florence)
      (assigned day11 florence) (assigned day12 florence)
    )
  )
)