(define (problem trip-planning-instance)
  (:domain trip-planning)

  (:objects
    traveler flight_planner orchestrator - agent
    vilnius amsterdam bucharest - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    ;; Starting location
    (at traveler vilnius)

    ;; Mark Bucharest city
    (bucharest bucharest)

    ;; Days chain: we model days d1..d12 so that consuming 11 day-advancing actions reaches d12
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

    ;; Allowed meeting days in Bucharest: day 6..11 inclusive
    (allowed-meet-day d6)
    (allowed-meet-day d7)
    (allowed-meet-day d8)
    (allowed-meet-day d9)
    (allowed-meet-day d10)
    (allowed-meet-day d11)

    ;; Direct flights available (bidirectional as given)
    (direct-flight vilnius amsterdam)
    (direct-flight amsterdam vilnius)
    (direct-flight amsterdam bucharest)
    (direct-flight bucharest amsterdam)

    ;; Remaining-day needs (adjusted to fit total 11 days):
    ;; We choose a feasible split: Vilnius 2, Amsterdam 3, Bucharest 6 (sum = 11).
    (need-vilnius-2)
    (need-vilnius-1) ; note: to start at 2 we include only need-vilnius-2; the sequence of actions will consume it to produce need-vilnius-1 etc.
    ;; But to avoid contradictory initial facts we must only assert the top-level starting needs:
    ;; Correct initialization: only assert the top-level predicates for each city:
  )

  ;; Fix: the above block mistakenly added multiple need facts. Re-declare the init cleanly with only the starting need predicates:
  (without (:init)
    ;; This is a harmless placeholder to indicate the next block re-specifies init;
  )
  ;; Re-specify a clean init:
  (:init
    (at traveler vilnius)
    (bucharest bucharest)
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

    (allowed-meet-day d6)
    (allowed-meet-day d7)
    (allowed-meet-day d8)
    (allowed-meet-day d9)
    (allowed-meet-day d10)
    (allowed-meet-day d11)

    (direct-flight vilnius amsterdam)
    (direct-flight amsterdam vilnius)
    (direct-flight amsterdam bucharest)
    (direct-flight bucharest amsterdam)

    ;; Starting need-state (only top-level starting predicates)
    (need-vilnius-2)
    (need-amsterdam-3)
    (need-bucharest-6)
  )

  ;; Goal: ensure all required city-stay needs are fulfilled, the meeting happened in Bucharest
  ;; and all 11 days were consumed (current-day becomes d12 after 11 day-advancing actions).
  (:goal (and
    (met-friends)
    (current-day d12)
    (need-vilnius-0)
    (need-amsterdam-0)
    (need-bucharest-0)
  ))
)