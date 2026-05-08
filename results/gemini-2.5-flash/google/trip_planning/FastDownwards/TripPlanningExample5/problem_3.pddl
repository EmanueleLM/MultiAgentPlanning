(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day ; Added day17 to allow day16 actions to have a next_day
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - duration_count
  )
  (:init
    ;; Initial location and day
    (at oslo)
    (current_day day1)

    ;; Day sequence for 16 days
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)
    (next_day day11 day12)
    (next_day day12 day13)
    (next_day day13 day14)
    (next_day day14 day15)
    (next_day day15 day16)
    (next_day day16 day17) ; Added for consistency if an action occurs on day16 and advances the day

    ;; Duration count succession (n, n+1)
    (succeeds d0 d1) (succeeds d1 d2) (succeeds d2 d3) (succeeds d3 d4)
    (succeeds d4 d5) (succeeds d5 d6) (succeeds d6 d7) (succeeds d7 d8)
    (succeeds d8 d9) (succeeds d9 d10) (succeeds d10 d11) (succeeds d11 d12)
    (succeeds d12 d13) (succeeds d13 d14) (succeeds d14 d15) (succeeds d15 d16)

    ;; Flight connections (bidirectional)
    (has_flight oslo dubrovnik)
    (has_flight dubrovnik oslo)
    (has_flight porto oslo)
    (has_flight oslo porto)

    ;; Initial days spent in cities and preferred durations (symbolic)
    ;; Agent starts on day1 in Oslo, so 1 day is already spent there.
    (city_current_stay_duration oslo d1)
    (city_current_stay_duration porto d0)
    (city_current_stay_duration dubrovnik d0)

    (city_preferred_duration oslo d6)
    (city_preferred_duration porto d7)
    (city_preferred_duration dubrovnik d5)

    ;; Initial cost
    (= (total_cost) 0)

    ;; Mark initial city as visited
    (visited_city_at_least_once oslo)
  )
  (:goal (and
            (current_day day17)             ; The trip must end AFTER Day 16, i.e., current_day is day17
            (conference_day_12_attended)    ; Conference on Day 12 must be attended
            (conference_day_16_attended)    ; Conference on Day 16 must be attended
            (visited_city_at_least_once oslo)
            (visited_city_at_least_once porto)
            (visited_city_at_least_once dubrovnik)
        ))
  (:metric minimize (total_cost))
)