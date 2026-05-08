(define (problem trip-15days)
  (:domain trip)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    vno vie vlc - city
    stage-vno stage-vie stage-vlc - stage
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

    ;; Static stage windows (explicit ordered time windows mapped to cities)
    ;; Stage 1: days 1-3 => Vilnius (vno)
    (in-stage day1 stage-vno) (in-stage day2 stage-vno) (in-stage day3 stage-vno)
    (stage-city stage-vno vno)

    ;; Stage 2: days 4-8 => Vienna (vie)
    (in-stage day4 stage-vie) (in-stage day5 stage-vie) (in-stage day6 stage-vie)
    (in-stage day7 stage-vie) (in-stage day8 stage-vie)
    (stage-city stage-vie vie)

    ;; Stage 3: days 9-15 => Valencia (vlc)  -- enforces presence in Valencia for days 9..15
    (in-stage day9 stage-vlc) (in-stage day10 stage-vlc) (in-stage day11 stage-vlc)
    (in-stage day12 stage-vlc) (in-stage day13 stage-vlc) (in-stage day14 stage-vlc)
    (in-stage day15 stage-vlc)
    (stage-city stage-vlc vlc)

    ;; starting location: day1 = Vilnius
    (at day1 vno)
    (assigned day1)
  )

  ;; Goals: exact city assignment for every day 1..15 to enforce contiguous occupancy blocks
  ;; and to precisely satisfy the required durations per stage:
  ;; Vilnius: days 1-3 (3 days), Vienna: days 4-8 (5 days), Valencia: days 9-15 (7 days).
  ;; This also enforces presence in Valencia on the conference days (day9 and day15).
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