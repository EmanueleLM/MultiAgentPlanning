(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    agent1 agent2 agent3 - agent
    Reykjavik Vienna Venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; day ordering (total trip length is 11 days, explicit chain)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; allowed direct flights (only these direct connections are allowed)
    (direct Reykjavik Vienna)
    (direct Vienna Reykjavik)
    (direct Vienna Venice)
    (direct Venice Vienna)

    ;; Arrival days according to proposals (treated as hard constraints)
    ;; Agent1: arrival_day = 1, duration = 2 -> must be in Reykjavik on days 1..2
    (at agent1 Reykjavik day1)

    ;; Agent2: arrival_day = 1, duration = 7 -> must be in Vienna on days 1..7
    (at agent2 Vienna day1)

    ;; Agent3: arrival_day = 8, duration = 4, wedding_days_covered = [8,9,10,11]
    ;; Must be in Venice on days 8..11 (wedding attendance between day 8 and 11 is encoded)
    (at agent3 Venice day8)
  )

  ;; Goals encode all hard temporal constraints derived from proposals and public info:
  ;; - Each agent must occupy specified city for each day in their duration window.
  ;; - Wedding attendance requirement: agent3 in Venice on days 8..11.
  ;; Note: The planner must use stay/travel actions to produce these per-day facts
  ;; starting from the arrival-day facts in :init.
  (:goal
    (and
      ;; Agent1: Reykjavik days 1..2
      (at agent1 Reykjavik day1)
      (at agent1 Reykjavik day2)

      ;; Agent2: Vienna days 1..7
      (at agent2 Vienna day1)
      (at agent2 Vienna day2)
      (at agent2 Vienna day3)
      (at agent2 Vienna day4)
      (at agent2 Vienna day5)
      (at agent2 Vienna day6)
      (at agent2 Vienna day7)

      ;; Agent3: Venice days 8..11 (covers wedding days 8-11)
      (at agent3 Venice day8)
      (at agent3 Venice day9)
      (at agent3 Venice day10)
      (at agent3 Venice day11)
    )
  )
)