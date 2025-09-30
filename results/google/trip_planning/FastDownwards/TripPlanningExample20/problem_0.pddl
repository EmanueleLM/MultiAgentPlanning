(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    istanbul budapest dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    istanbul_agent budapest_agent dubrovnik_agent - agent
  )

  (:init
    ;; Starting location: earliest feasible start chosen (Dubrovnik), per agents' guidance.
    (at dubrovnik)

    ;; 12-day horizon: all days initially free
    (free-day day1) (free-day day2) (free-day day3) (free-day day4)
    (free-day day5) (free-day day6) (free-day day7) (free-day day8)
    (free-day day9) (free-day day10) (free-day day11) (free-day day12)
  )

  ;; Goal: encode the hard stay preferences exactly as requested by each agent (treated as hard).
  ;; Dubrovnik: preferred 3 days (days 1..3)
  ;; Istanbul: preferred 5 days (days 4..8)
  ;; Budapest: preferred 6 days (days 7..12)
  ;; Note: These preferences together demand 14 stay-days, but only 12 distinct day objects exist.
  ;; This intentional encoding makes the contradiction explicit (no plan exists).
  (:goal
    (and
      ;; Dubrovnik stays (3 days)
      (stayed dubrovnik day1)
      (stayed dubrovnik day2)
      (stayed dubrovnik day3)

      ;; Istanbul stays (5 days)
      (stayed istanbul day4)
      (stayed istanbul day5)
      (stayed istanbul day6)
      (stayed istanbul day7)
      (stayed istanbul day8)

      ;; Budapest stays (6 days)
      (stayed budapest day7)
      (stayed budapest day8)
      (stayed budapest day9)
      (stayed budapest day10)
      (stayed budapest day11)
      (stayed budapest day12)

      ;; End at Budapest (trip culmination)
      (at budapest)
    )
  )
)