(define (problem travel-problem)
  (:domain travel-planning)
  (:objects
    florence barcelona helsinki - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )
  (:init
    ;; day objects
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6) (day d7) (day d8)
    (day d9) (day d10) (day d11) (day d12) (day d13) (day d14)

    ;; successor (discrete horizon)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12)
    (next d12 d13) (next d13 d14)

    ;; Start state: traveler begins in Barcelona on day 1
    (current d1)
    (at barcelona d1)
    (covered d1) ; day 1 already covered by the start location

    ;; Meeting is allowed only on days 9 through 14 (hard constraint)
    (allowed-meet-day d9) (allowed-meet-day d10) (allowed-meet-day d11)
    (allowed-meet-day d12) (allowed-meet-day d13) (allowed-meet-day d14)
  )

  ;; Goals:
  ;; - every day d1..d14 must be covered (planner must assign a city for each day by advancing current day)
  ;; - met must be achieved by being in Florence on one of the allowed meeting days (9..14)
  (:goal
    (and
      (covered d1) (covered d2) (covered d3) (covered d4) (covered d5) (covered d6)
      (covered d7) (covered d8) (covered d9) (covered d10) (covered d11) (covered d12)
      (covered d13) (covered d14)
      (met)
    )
  )
)