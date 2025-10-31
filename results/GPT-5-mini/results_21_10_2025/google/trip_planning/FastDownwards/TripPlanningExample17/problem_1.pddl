(define (problem integrated-11-day-trip-17)
  (:domain trip-orchestration-17)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; day succession chain
    (day_next day1 day2)
    (day_next day2 day3)
    (day_next day3 day4)
    (day_next day4 day5)
    (day_next day5 day6)
    (day_next day6 day7)
    (day_next day7 day8)
    (day_next day8 day9)
    (day_next day9 day10)
    (day_next day10 day11)

    ;; direct flights (modeled as available edges)
    (direct_flight copenhagen vienna)
    (direct_flight vienna copenhagen)
    (direct_flight vienna lyon)
    (direct_flight lyon vienna)

    ;; Trip starts in Copenhagen on day1 (conference day)
    (at copenhagen day1)
    (visited day1)
  )

  ;; Goal: enforce mandatory constraints and that every day of the 11-day trip
  ;; is assigned (traveler is in some city each day). The concrete day-to-city
  ;; assignment is left to the planner but must satisfy the mandatory constraints:
  ;; - be in Copenhagen on day1 and on day5 (conference days)
  ;; - cover all days 1..11 (visited)
  (:goal (and
    ;; mandatory conference presences
    (at copenhagen day1)
    (at copenhagen day5)

    ;; ensure every day is assigned (traveler somewhere on each day)
    (visited day1)
    (visited day2)
    (visited day3)
    (visited day4)
    (visited day5)
    (visited day6)
    (visited day7)
    (visited day8)
    (visited day9)
    (visited day10)
    (visited day11)
  ))
)