(define (problem integrated-euro-itinerary-problem)
  (:domain integrated-euro-itinerary)

  (:objects
    venice zurich florence - city
    venice_agent_obj florence_agent_obj zurich_agent_obj - agent
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    (at venice)

    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    (current-day day0)

    (consumes day0 day1)
    (consumes day1 day2)
    (consumes day2 day3)
    (consumes day3 day4)
    (consumes day4 day5)
    (consumes day5 day6)
    (consumes day6 day7)
    (consumes day7 day8)
    (consumes day8 day9)
    (consumes day9 day10)
    (consumes day10 day11)
    (consumes day11 day12)
  )

  (:goal (and
           (day-at day0 venice)
           (day-at day1 venice)
           (day-at day2 venice)
           (day-at day3 venice)
           (day-at day4 venice)
           (day-at day5 venice)

           (day-at day6 zurich)
           (day-at day7 zurich)

           (day-at day8 florence)
           (day-at day9 florence)
           (day-at day10 florence)
           (day-at day11 florence)

           (current-day day12)
         )
  )
)