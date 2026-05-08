; PDDL problem: 16-day trip (Lisbon, Florence, Copenhagen)
;
; This problem encodes:
; - 16 sequential days: day1 .. day16
; - direct-flight connectivity:
;     Copenhagen <-> Lisbon
;     Lisbon <-> Florence
;   (No direct flight Copenhagen <-> Florence)
;   Reflexive flights (city->same-city) are also declared to represent staying in place day-to-day.
; - Hard conference attendance constraints:
;     - day1: Copenhagen (enforced by initial state)
;     - day7: Copenhagen (enforced by a goal condition)
;
; Because the traveler's requested city-duration totals are inconsistent with the 16-day horizon
; (requested 7 Lisbon + 4 Florence + 7 Copenhagen = 18 > 16), numeric stay counts are NOT encoded as hard goals.
; The planner will instead find any feasible day-by-day assignment that respects:
;  - direct-flight-only commuting,
;  - conference days,
;  - sequential assignment of days.
;
(define (problem trip-16days)
  (:domain trip-scheduling)

  (:objects
    ; days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    ; cities
    copenhagen lisbon florence - city
  )

  (:init
    ; temporal order (immediate successor)
    (next day1 day2)  (next day2 day3)  (next day3 day4)  (next day4 day5)
    (next day5 day6)  (next day6 day7)  (next day7 day8)  (next day8 day9)
    (next day9 day10) (next day10 day11)(next day11 day12)(next day12 day13)
    (next day13 day14)(next day14 day15)(next day15 day16)

    ; direct flights (bidirectional) as provided by flight_service
    ; Copenhagen <-> Lisbon
    (flight copenhagen lisbon)
    (flight lisbon copenhagen)
    ; Lisbon <-> Florence
    (flight lisbon florence)
    (flight florence lisbon)

    ; reflexive flights to allow staying in the same city across successive days
    (flight copenhagen copenhagen)
    (flight lisbon lisbon)
    (flight florence florence)

    ; Starting condition: day1 must be Copenhagen (conference). Mark day1 assigned.
    (assigned day1)
    (at day1 copenhagen)

    ; NOTE: day7 must be Copenhagen as well — this is enforced in the goal (hard constraint).
  )

  ; Goals:
  ; - All days 1..16 must be assigned
  ; - Conferences: day1 and day7 must be in Copenhagen
  (:goal
    (and
      (assigned day1)  (assigned day2)  (assigned day3)  (assigned day4)
      (assigned day5)  (assigned day6)  (assigned day7)  (assigned day8)
      (assigned day9)  (assigned day10) (assigned day11) (assigned day12)
      (assigned day13) (assigned day14) (assigned day15) (assigned day16)

      ; Conference hard constraints:
      (at day1 copenhagen)
      (at day7 copenhagen)
    )
  )

  ; No metric specified. The planner will search for any feasible assignment satisfying connectivity and conference constraints.
)