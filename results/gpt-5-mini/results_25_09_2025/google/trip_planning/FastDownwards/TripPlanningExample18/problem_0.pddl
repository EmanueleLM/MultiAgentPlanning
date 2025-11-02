(define (problem trip-11days)
  (:domain multiagent-travel)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    amsterdam vilnius bucharest - city
    traveler_agent flight_planner_agent - agent
  )

  (:init
    ;; Time progression
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)

    ;; Direct flight connectivity (only allowed direct flights)
    (flight amsterdam bucharest)
    (flight bucharest amsterdam)
    (flight amsterdam vilnius)
    (flight vilnius amsterdam)
    ;; Note: No direct flight between Vilnius and Bucharest per shared knowledge

    ;; Initial conditions: start the trip at Amsterdam on day1
    (current-day day1)
    (at traveler_agent amsterdam day1)
    (visited amsterdam)

    ;; Meeting allowed days: between day6 and day11 inclusive
    (allowed-meet day6) (allowed-meet day7) (allowed-meet day8)
    (allowed-meet day9) (allowed-meet day10) (allowed-meet day11)
  )

  ;; Goals:
  ;; - Reach the end of the trip (current day = day11),
  ;; - Visit Amsterdam, Vilnius and Bucharest at least once,
  ;; - Ensure the meeting in Bucharest has occurred between day6 and day11.
  (:goal (and
           (current-day day11)
           (visited amsterdam)
           (visited vilnius)
           (visited bucharest)
           (meeting-done)
         ))
  (:metric minimize 0)
)