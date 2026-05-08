(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
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
    (next_day day16 day17) ; The trip must end AFTER Day 16, so the last current_day is day17

    ;; Duration count succession (n, n+1)
    (succeeds d0 d1) (succeeds d1 d2) (succeeds d2 d3) (succeeds d3 d4)
    (succeeds d4 d5) (succeeds d5 d6) (succeeds d6 d7) (succeeds d7 d8)
    (succeeds d8 d9) (succeeds d9 d10) (succeeds d10 d11) (succeeds d11 d12)
    (succeeds d12 d13) (succeeds d13 d14) (succeeds d14 d15) (succeeds d15 d16)

    ;; Less_than and Ge_than for duration counts
    ;; d0 < d1, ..., d0 < d16
    (less_than d0 d1) (less_than d0 d2) (less_than d0 d3) (less_than d0 d4) (less_than d0 d5) (less_than d0 d6) (less_than d0 d7) (less_than d0 d8) (less_than d0 d9) (less_than d0 d10) (less_than d0 d11) (less_than d0 d12) (less_than d0 d13) (less_than d0 d14) (less_than d0 d15) (less_than d0 d16)
    (less_than d1 d2) (less_than d1 d3) (less_than d1 d4) (less_than d1 d5) (less_than d1 d6) (less_than d1 d7) (less_than d1 d8) (less_than d1 d9) (less_than d1 d10) (less_than d1 d11) (less_than d1 d12) (less_than d1 d13) (less_than d1 d14) (less_than d1 d15) (less_than d1 d16)
    (less_than d2 d3) (less_than d2 d4) (less_than d2 d5) (less_than d2 d6) (less_than d2 d7) (less_than d2 d8) (less_than d2 d9) (less_than d2 d10) (less_than d2 d11) (less_than d2 d12) (less_than d2 d13) (less_than d2 d14) (less_than d2 d15) (less_than d2 d16)
    (less_than d3 d4) (less_than d3 d5) (less_than d3 d6) (less_than d3 d7) (less_than d3 d8) (less_than d3 d9) (less_than d3 d10) (less_than d3 d11) (less_than d3 d12) (less_than d3 d13) (less_than d3 d14) (less_than d3 d15) (less_than d3 d16)
    (less_than d4 d5) (less_than d4 d6) (less_than d4 d7) (less_than d4 d8) (less_than d4 d9) (less_than d4 d10) (less_than d4 d11) (less_than d4 d12) (less_than d4 d13) (less_than d4 d14) (less_than d4 d15) (less_than d4 d16)
    (less_than d5 d6) (less_than d5 d7) (less_than d5 d8) (less_than d5 d9) (less_than d5 d10) (less_than d5 d11) (less_than d5 d12) (less_than d5 d13) (less_than d5 d14) (less_than d5 d15) (less_than d5 d16)
    (less_than d6 d7) (less_than d6 d8) (less_than d6 d9) (less_than d6 d10) (less_than d6 d11) (less_than d6 d12) (less_than d6 d13) (less_than d6 d14) (less_than d6 d15) (less_than d6 d16)
    (less_than d7 d8) (less_than d7 d9) (less_than d7 d10) (less_than d7 d11) (less_than d7 d12) (less_than d7 d13) (less_than d7 d14) (less_than d7 d15) (less_than d7 d16)
    (less_than d8 d9) (less_than d8 d10) (less_than d8 d11) (less_than d8 d12) (less_than d8 d13) (less_than d8 d14) (less_than d8 d15) (less_than d8 d16)
    (less_than d9 d10) (less_than d9 d11) (less_than d9 d12) (less_than d9 d13) (less_than d9 d14) (less_than d9 d15) (less_than d9 d16)
    (less_than d10 d11) (less_than d10 d12) (less_than d10 d13) (less_than d10 d14) (less_than d10 d15) (less_than d10 d16)
    (less_than d11 d12) (less_than d11 d13) (less_than d11 d14) (less_than d11 d15) (less_than d11 d16)
    (less_than d12 d13) (less_than d12 d14) (less_than d12 d15) (less_than d12 d16)
    (less_than d13 d14) (less_than d13 d15) (less_than d13 d16)
    (less_than d14 d15) (less_than d14 d16)
    (less_than d15 d16)

    ;; d0 >= d0, d1 >= d0, d1 >= d1, ...
    (ge_than d0 d0)
    (ge_than d1 d0) (ge_than d1 d1)
    (ge_than d2 d0) (ge_than d2 d1) (ge_than d2 d2)
    (ge_than d3 d0) (ge_than d3 d1) (ge_than d3 d2) (ge_than d3 d3)
    (ge_than d4 d0) (ge_than d4 d1) (ge_than d4 d2) (ge_than d4 d3) (ge_than d4 d4)
    (ge_than d5 d0) (ge_than d5 d1) (ge_than d5 d2) (ge_than d5 d3) (ge_than d5 d4) (ge_than d5 d5)
    (ge_than d6 d0) (ge_than d6 d1) (ge_than d6 d2) (ge_than d6 d3) (ge_than d6 d4) (ge_than d6 d5) (ge_than d6 d6)
    (ge_than d7 d0) (ge_than d7 d1) (ge_than d7 d2) (ge_than d7 d3) (ge_than d7 d4) (ge_than d7 d5) (ge_than d7 d6) (ge_than d7 d7)
    (ge_than d8 d0) (ge_than d8 d1) (ge_than d8 d2) (ge_than d8 d3) (ge_than d8 d4) (ge_than d8 d5) (ge_than d8 d6) (ge_than d8 d7) (ge_than d8 d8)
    (ge_than d9 d0) (ge_than d9 d1) (ge_than d9 d2) (ge_than d9 d3) (ge_than d9 d4) (ge_than d9 d5) (ge_than d9 d6) (ge_than d9 d7) (ge_than d9 d8) (ge_than d9 d9)
    (ge_than d10 d0) (ge_than d10 d1) (ge_than d10 d2) (ge_than d10 d3) (ge_than d10 d4) (ge_than d10 d5) (ge_than d10 d6) (ge_than d10 d7) (ge_than d10 d8) (ge_than d10 d9) (ge_than d10 d10)
    (ge_than d11 d0) (ge_than d11 d1) (ge_than d11 d2) (ge_than d11 d3) (ge_than d11 d4) (ge_than d11 d5) (ge_than d11 d6) (ge_than d11 d7) (ge_than d11 d8) (ge_than d11 d9) (ge_than d11 d10) (ge_than d11 d11)
    (ge_than d12 d0) (ge_than d12 d1) (ge_than d12 d2) (ge_than d12 d3) (ge_than d12 d4) (ge_than d12 d5) (ge_than d12 d6) (ge_than d12 d7) (ge_than d12 d8) (ge_than d12 d9) (ge_than d12 d10) (ge_than d12 d11) (ge_than d12 d12)
    (ge_than d13 d0) (ge_than d13 d1) (ge_than d13 d2) (ge_than d13 d3) (ge_than d13 d4) (ge_than d13 d5) (ge_than d13 d6) (ge_than d13 d7) (ge_than d13 d8) (ge_than d13 d9) (ge_than d13 d10) (ge_than d13 d11) (ge_than d13 d12) (ge_than d13 d13)
    (ge_than d14 d0) (ge_than d14 d1) (ge_than d14 d2) (ge_than d14 d3) (ge_than d14 d4) (ge_than d14 d5) (ge_than d14 d6) (ge_than d14 d7) (ge_than d14 d8) (ge_than d14 d9) (ge_than d14 d10) (ge_than d14 d11) (ge_than d14 d12) (ge_than d14 d13) (ge_than d14 d14)
    (ge_than d15 d0) (ge_than d15 d1) (ge_than d15 d2) (ge_than d15 d3) (ge_than d15 d4) (ge_than d15 d5) (ge_than d15 d6) (ge_than d15 d7) (ge_than d15 d8) (ge_than d15 d9) (ge_than d15 d10) (ge_than d15 d11) (ge_than d15 d12) (ge_than d15 d13) (ge_than d15 d14) (ge_than d15 d15)
    (ge_than d16 d0) (ge_than d16 d1) (ge_than d16 d2) (ge_than d16 d3) (ge_than d16 d4) (ge_than d16 d5) (ge_than d16 d6) (ge_than d16 d7) (ge_than d16 d8) (ge_than d16 d9) (ge_than d16 d10) (ge_than d16 d11) (ge_than d16 d12) (ge_than d16 d13) (ge_than d16 d14) (ge_than d16 d15) (ge_than d16 d16)

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