(define (problem trip-problem)
  (:domain trip)

  ; ================================================================
  ; Allocation decision and rationale (documented as comments per spec)
  ; - Agents requested: Florence 6 days, Barcelona 5 days, Helsinki 5 days => total 16 > available 14
  ; - Mandatory constraint: meeting in Florence between day9 and day14 inclusive (must be honored).
  ; - We prioritize the mandatory meeting window and the earliest feasible meeting day.
  ; - Chosen feasible allocation (sum = 14) that honors the meeting window and approximates preferences:
  ;     * Florence: 6 days  -> days 9..14 (meeting occurs at day9, the earliest allowed)
  ;     * Barcelona: 4 days -> days 5..8  (reduced from requested 5 -> 4)
  ;     * Helsinki: 4 days  -> days 1..4  (reduced from requested 5 -> 4)
  ; - Trade-offs: To respect the direct-flight graph (Helsinki <-> Barcelona, Barcelona <-> Florence)
  ;   and to arrive in Florence by day9, we allocate contiguous blocks and perform two flights:
  ;     1) Fly Helsinki -> Barcelona on day4 to arrive Barcelona on day5.
  ;     2) Fly Barcelona -> Florence on day8 to arrive Florence on day9 (meeting).
  ; - Starting city choice: we select Helsinki as the start location on day1 to enable the H->B->F route
  ;   and to make the meeting occur at the earliest allowed day (day9). This start choice is part of
  ;   the allocation (documented here) to produce a concrete feasible plan model.
  ; ================================================================

  (:objects
    florence barcelona helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ; consecutive day relations
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ; direct flight connections (public information)
    (conn barcelona florence)
    (conn florence barcelona)
    (conn helsinki barcelona)
    (conn barcelona helsinki)

    ; initial location (chosen as part of feasible allocation to satisfy constraints)
    (at helsinki day1)
  )

  ; Goals explicitly enforce the chosen allocation (presence at each city on each day).
  ; These goals encode the stay-duration constraints by requiring presence on the specified days.
  (:goal
    (and
      ; Helsinki presence days 1..4 (allocated 4 days)
      (at helsinki day1)
      (at helsinki day2)
      (at helsinki day3)
      (at helsinki day4)

      ; Barcelona presence days 5..8 (allocated 4 days)
      (at barcelona day5)
      (at barcelona day6)
      (at barcelona day7)
      (at barcelona day8)

      ; Florence presence days 9..14 (allocated 6 days, includes meeting window)
      (at florence day9)  ; meeting occurs at earliest allowed day (day9)
      (at florence day10)
      (at florence day11)
      (at florence day12)
      (at florence day13)
      (at florence day14)
    )
  )
)