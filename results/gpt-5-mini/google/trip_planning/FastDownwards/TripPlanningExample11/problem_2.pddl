(define (problem trip-15days)
  (:domain trip)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    vno vie vlc - city
  )

  (:init
    ;; successor links for days 1..15 (nights 1..14)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15)

    ;; direct flights available (only permitted direct legs)
    (direct vno vie)
    (direct vie vno)
    (direct vie vlc)
    (direct vlc vie)

    ;; initial known location: start day assigned to Vilnius (reflects the stated intention to stay in Vilnius)
    (at day1 vno)
    (assigned day1)
  )

  ;; Hard goals derived from the human specification:
  ;; The specification requests stays of Vilnius: 5 days, Vienna: 5 days, Valencia: 7 days.
  ;; These totals sum to 17 days while only 15 days exist; we encode the requested per-city day assignments exactly.
  ;; This intentionally makes the instance infeasible (contradictory) so the inconsistency is explicit to the planner.
  (:goal (and
    ;; Vilnius: days 1-5 (5 days)
    (at day1 vno)
    (at day2 vno)
    (at day3 vno)
    (at day4 vno)
    (at day5 vno)

    ;; Vienna: days 6-10 (5 days)
    (at day6 vie)
    (at day7 vie)
    (at day8 vie)
    (at day9 vie)
    (at day10 vie)

    ;; Valencia: days 9-15 (7 days) -- overlaps days 9-10 with Vienna above, and enforces presence in Valencia on conference days (day9 and day15)
    (at day9 vlc)
    (at day10 vlc)
    (at day11 vlc)
    (at day12 vlc)
    (at day13 vlc)
    (at day14 vlc)
    (at day15 vlc)
  ))
)