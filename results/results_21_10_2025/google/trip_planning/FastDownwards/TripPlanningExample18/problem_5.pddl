(define (problem trip-planning-instance)
  (:domain trip-planning)

  (:objects
    traveler flight_planner orchestrator - agent
    vilnius amsterdam bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    ;; start location
    (at traveler vilnius)
    ;; mark which city is Bucharest for meeting predicate
    (is-bucharest bucharest)

    ;; day progression for 11 days modelled as d1..d12 where reaching d12 means 11 full days passed
    (current-day d1)
    (next-day d1 d2)
    (next-day d2 d3)
    (next-day d3 d4)
    (next-day d4 d5)
    (next-day d5 d6)
    (next-day d6 d7)
    (next-day d7 d8)
    (next-day d8 d9)
    (next-day d9 d10)
    (next-day d10 d11)
    (next-day d11 d12)

    ;; meeting window in Bucharest: days 6..11 inclusive
    (allowed-meet-day d6)
    (allowed-meet-day d7)
    (allowed-meet-day d8)
    (allowed-meet-day d9)
    (allowed-meet-day d10)
    (allowed-meet-day d11)

    ;; direct flights as provided by flight_planner (only direct connections allowed)
    (direct-flight vilnius amsterdam)
    (direct-flight amsterdam vilnius)
    (direct-flight amsterdam bucharest)
    (direct-flight bucharest amsterdam)

    ;; Traveler's stated stay requirements (private preferences preserved)
    (need-vilnius-2)
    (need-amsterdam-5)
    (need-bucharest-6)
  )

  (:goal (and
    (met-friends)
    (current-day d12)
    (need-vilnius-0)
    (need-amsterdam-0)
    (need-bucharest-0)
  ))
)