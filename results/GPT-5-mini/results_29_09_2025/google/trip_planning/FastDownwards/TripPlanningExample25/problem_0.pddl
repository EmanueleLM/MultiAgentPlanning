(define (problem trip-integration)
  (:domain trip)
  (:objects
    valencia lyon split - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; Initial location assumption (earliest feasible start): start in Valencia on day1.
    ;; This is an explicit modeling choice to prefer the earliest feasible start as requested.
    (at valencia day1)

    ;; Direct-flight edges (public information)
    (flight valencia lyon)
    (flight lyon valencia)
    (flight lyon split)
    (flight split lyon)

    ;; Day successor relation (discrete time steps 1..16)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)
  )

  ;; Goal: encode all city-specific hard constraints as explicit day-presence requirements.
  ;; - Valencia: exactly 5 days required — modeled here as presence on days 1..5 (earliest feasible)
  ;; - Split: must be present for the show days 10..16 inclusive (7 days) — hard constraint
  ;; - Lyon: requested 6 days — modeled here as presence on days 6..11 (earliest contiguous block)
  ;;
  ;; NOTE: The three hard stay-length requirements sum to 18 days (5 + 7 + 6) but the trip horizon is 16 days.
  ;; This encoding therefore intentionally reflects the reported hard constraints; the conjunction below is
  ;; inconsistent with a single exclusive occupancy per day over a 16-day horizon. A planner will therefore
  ;; find no plan that satisfies all hard constraints simultaneously.
  (:goal
    (and
      ;; Valencia presence (5 days)
      (at valencia day1) (at valencia day2) (at valencia day3) (at valencia day4) (at valencia day5)

      ;; Split presence for the show (days 10..16 inclusive; 7 days)
      (at split day10) (at split day11) (at split day12) (at split day13) (at split day14) (at split day15) (at split day16)

      ;; Lyon requested 6 days — earliest contiguous assignment available in remaining window chosen here:
      ;; days 6..11 (this overlaps with Split on days 10..11, intentionally reflecting the agents' incompatible hard constraints)
      (at lyon day6) (at lyon day7) (at lyon day8) (at lyon day9) (at lyon day10) (at lyon day11)
    )
  )
)