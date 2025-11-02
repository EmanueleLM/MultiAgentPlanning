(define (problem itinerary-11days-preferred)
  (:domain travel-11days)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    berlin porto krakow - city
  )
  (:init
    ; day linkage
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

    ; all days initially unassigned
    (free day1)
    (free day2)
    (free day3)
    (free day4)
    (free day5)
    (free day6)
    (free day7)
    (free day8)
    (free day9)
    (free day10)
    (free day11)

    ; first day marker
    (first day1)

    ; direct flight adjacency (both directions where allowed)
    (direct berlin porto)
    (direct porto berlin)
    (direct berlin krakow)
    (direct krakow berlin)

    ; begin assignment
    (start)
  )
  (:goal (and
    ; chosen concrete itinerary satisfying all hard constraints and prioritized preferences:
    ; days 1–4: Krakow
    (at day1 krakow)
    (at day2 krakow)
    (at day3 krakow)
    (at day4 krakow)
    ; days 5–9: Berlin
    (at day5 berlin)
    (at day6 berlin)
    (at day7 berlin)
    (at day8 berlin)
    (at day9 berlin)
    ; days 10–11: Porto (wedding requirement)
    (at day10 porto)
    (at day11 porto)
  ))
)