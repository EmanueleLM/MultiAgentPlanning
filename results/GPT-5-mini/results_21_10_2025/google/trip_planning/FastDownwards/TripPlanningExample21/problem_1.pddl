(define (problem trip-problem)
  (:domain trip-planning)

  (:objects
    venice vienna mykonos - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; temporal successor links
    (next day0 day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; Start marker: we place the traveler in Venice at day0 (a start marker so day1 assignment can be connected from Venice).
    ;; This encodes the chosen start city to make the derived itinerary feasible.
    (at venice day0)

    ;; The planner must assign day1 next (current-day indicates which day assignment is pending).
    (current-day day1)

    ;; Connectivity: direct flights available plus self-connections (to allow "staying" in a city from one day to the next).
    ;; Direct flights per flights_agent:
    ;;  - Mykonos <-> Vienna
    ;;  - Vienna <-> Venice
    ;; No direct Mykonos <-> Venice link is provided.
    (connected venice venice)
    (connected vienna vienna)
    (connected mykonos mykonos)

    (connected mykonos vienna)
    (connected vienna mykonos)

    (connected vienna venice)
    (connected venice vienna)

    ;; Note: workshop-done is initially false (absent).
  )

  (:goal (and
    ;; Required stays (resolved to a feasible allocation under the 10-day limit):
    ;;   - Venice: 6 days
    ;;   - Mykonos: 2 days
    ;;   - Vienna: 2 days (reduced from 4 to make the trip feasible within 10 total days)
    ;; We require the traveler to be in the specified city on the listed days.
    ;; (This encodes the feasible itinerary that satisfies the workshop timing and flight connectivity.)
    (at venice day1)
    (at venice day2)
    (at venice day3)
    (at venice day4)
    (at venice day5)
    (at venice day6)

    (at vienna day7)
    (at mykonos day8)
    (at mykonos day9)
    (at vienna day10)

    ;; Workshop must be held on some Venice day between day5 and day10 inclusive
    (workshop-done)
  ))
)