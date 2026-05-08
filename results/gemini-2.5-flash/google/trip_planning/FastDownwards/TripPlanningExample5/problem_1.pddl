(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )
  (:init
    ;; Initial location and day
    (at oslo) ; Starting in Oslo
    (is_day day1)

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

    ;; Flight connections (bidirectional)
    (has_flight oslo dubrovnik)
    (has_flight dubrovnik oslo)
    (has_flight porto oslo)
    (has_flight oslo porto)

    ;; Initial days spent in cities and preferred durations
    ;; Agent starts on day1 in Oslo, so 1 day is already spent there.
    (= (days_spent_in oslo) 1)
    (= (days_spent_in porto) 0)
    (= (days_spent_in dubrovnik) 0)

    (= (preferred_duration oslo) 6)
    (= (preferred_duration porto) 7)
    (= (preferred_duration dubrovnik) 5)

    ;; Initialize cost and actual trip days counter
    (= (total_cost) 0)
    (= (actual_trip_days) 1) ; Day 1 is accounted for by the initial location

    ;; Conference flags are implicitly false initially
  )
  (:goal (and
            (is_day day16)             ; The trip must end on Day 16
            (conference_day_12_met)    ; Conference on Day 12 must be attended
            (conference_day_16_met)    ; Conference on Day 16 must be attended
            (= (actual_trip_days) 16)  ; Ensure the total trip duration is exactly 16 days
        ))
  (:metric minimize (total_cost)) ; Minimize the sum of penalties (exceeding preferences, travel)
)