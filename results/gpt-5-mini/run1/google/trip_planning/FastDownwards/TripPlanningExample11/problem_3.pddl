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

    ;; direct flights available (bidirectional facts provided)
    (direct vno vie)
    (direct vie vno)
    (direct vie vlc)
    (direct vlc vie)

    ;; initial known location: start on day1 in Vilnius
    (at day1 vno)
    (assigned day1)
  )

  ;; Feasible itinerary (adjusted to fit 15 days and direct-flight constraints):
  ;; Vilnius: days 1-5
  ;; Vienna: days 6-8
  ;; Valencia: days 9-15 (must attend conferences on days 9 and 15)
  (:goal (and
    ;; Vilnius days 1-5
    (at day1 vno)
    (at day2 vno)
    (at day3 vno)
    (at day4 vno)
    (at day5 vno)

    ;; Vienna days 6-8
    (at day6 vie)
    (at day7 vie)
    (at day8 vie)

    ;; Valencia days 9-15 (conference days 9 and 15 covered)
    (at day9 vlc)
    (at day10 vlc)
    (at day11 vlc)
    (at day12 vlc)
    (at day13 vlc)
    (at day14 vlc)
    (at day15 vlc)
  ))
)