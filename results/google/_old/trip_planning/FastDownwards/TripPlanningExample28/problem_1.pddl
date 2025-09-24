(define (problem integrated-euro-itinerary-problem)
  (:domain integrated-euro-itinerary)

  (:objects
    venice zurich florence - city
    florence_agent - agent
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ;; Starting locations:
    (at venice)                       ;; agent1-style at Venice
    (at_agent florence_agent zurich)  ;; agent2-style (has agent object) starts at Zurich
    (at zurich)                       ;; agent3-style (agent-less) starts at Zurich

    (is-venice venice)

    ;; Direct flights (both predicate names supplied to satisfy all agents)
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    (direct-flight venice zurich)
    (direct-flight zurich venice)
    (direct-flight zurich florence)

    ;; Day bookkeeping: start at day12 (12 days remaining)
    (current-day day12)

    ;; Precomputed one-day transitions (consumes1: from -> to where to = from - 1)
    (consumes1 day12 day11)
    (consumes1 day11 day10)
    (consumes1 day10 day9)
    (consumes1 day9 day8)
    (consumes1 day8 day7)
    (consumes1 day7 day6)
    (consumes1 day6 day5)
    (consumes1 day5 day4)
    (consumes1 day4 day3)
    (consumes1 day3 day2)
    (consumes1 day2 day1)
    (consumes1 day1 day0)

    ;; Precomputed two-day transitions (consumes2: from -> to where to = from - 2)
    (consumes2 day12 day10)
    (consumes2 day11 day9)
    (consumes2 day10 day8)
    (consumes2 day9 day7)
    (consumes2 day8 day6)
    (consumes2 day7 day5)
    (consumes2 day6 day4)
    (consumes2 day5 day3)
    (consumes2 day4 day2)
    (consumes2 day3 day1)
    (consumes2 day2 day0)
  )

  ;; Goal: visit all required cities and consume exactly the 12-day budget (current-day day0)
  (:goal (and
           (visited venice)
           (visited zurich)
           (visited florence)
           (current-day day0)
         )
  )

  (:metric minimize (total-cost))
)