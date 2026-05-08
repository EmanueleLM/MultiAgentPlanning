(define (problem trip-15days)
  (:domain trip)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    vno vie vlc - city
  )

  (:init
    ;; explicit successor (night) links for days 1..15 (nights 1..14)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15)

    ;; Direct-flight graph (only permitted direct legs)
    (direct vno vie)
    (direct vie vno)
    (direct vie vlc)
    (direct vlc vie)

    ;; starting location: day1 = Vilnius (consistent with orchestrator's resolved itinerary)
    (at day1 vno)
    (assigned day1)
  )

  ;; Goals: exact city assignment for every day 1..15 to encode the resolved feasible itinerary.
  ;; This enforces: Vilnius 3 days (days 1-3), Vienna 5 days (days 4-8), Valencia 7 days (days 9-15),
  ;; presence in Valencia on day 9 and day 15, and that all days are assigned (uniqueness follows from domain rules).
  (:goal (and
    (at day1 vno)
    (at day2 vno)
    (at day3 vno)

    (at day4 vie)
    (at day5 vie)
    (at day6 vie)
    (at day7 vie)
    (at day8 vie)

    (at day9 vlc)
    (at day10 vlc)
    (at day11 vlc)
    (at day12 vlc)
    (at day13 vlc)
    (at day14 vlc)
    (at day15 vlc)
  ))
)