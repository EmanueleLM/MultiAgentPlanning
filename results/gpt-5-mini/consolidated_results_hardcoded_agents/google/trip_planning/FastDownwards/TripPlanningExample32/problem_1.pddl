(define (problem trip_planning_32)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    Reykjavik Riga Paris - city
    reykjavik_agent riga_agent paris_agent orchestrator - agent
  )
  (:init
    (start day1)
    (prev day2 day1) (prev day3 day2) (prev day4 day3) (prev day5 day4) (prev day6 day5)
    (prev day7 day6) (prev day8 day7) (prev day9 day8) (prev day10 day9)
    (flight Paris Reykjavik) (flight Reykjavik Paris)
    (flight Riga Paris) (flight Paris Riga)
    (proposal-origin Reykjavik reykjavik_agent)
    (proposal-origin Riga riga_agent)
    (proposal-origin Paris paris_agent)
    (pref-duration-3 Riga)
    (pref-duration-4 Paris)
    (pref-contiguous Paris)
    (= (total-cost) 0)
  )
  (:goal (and
    (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
    (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
    (in day6 Reykjavik) (in day7 Reykjavik) (in day8 Reykjavik) (in day9 Reykjavik) (in day10 Reykjavik)
  ))
  (:metric minimize (total-cost))
)