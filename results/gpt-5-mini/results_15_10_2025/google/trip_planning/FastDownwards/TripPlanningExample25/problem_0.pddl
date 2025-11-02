(define (problem trip-problem)
  (:domain travel-domain)
  (:objects
    valencia lyon split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; Temporal successor chain
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15) (next d15 d16)

    ;; Explicit direct connections (informational; actions are per-route)
    (connected valencia lyon) (connected lyon valencia)
    (connected lyon split) (connected split lyon)

    ;; Earliest-feasible start: traveler at Valencia on day 1 (chosen per earliest preference)
    (at valencia d1)
  )

  ;; Goal: encode city-stay requirements exactly as hard goals (these make the problem infeasible)
  (:goal
    (and
      ;; Valencia: exactly 5 days required — encoded here as days 1..5 (earliest feasible allocation)
      (at valencia d1) (at valencia d2) (at valencia d3) (at valencia d4) (at valencia d5)

      ;; Split: 7 days including the show — show days are 10..16 inclusive (those 7 days)
      (at split d10) (at split d11) (at split d12) (at split d13) (at split d14) (at split d15) (at split d16)

      ;; Lyon: exactly 6 days required — earliest remaining block chosen here (days 6..11)
      ;; Note: days d10 and d11 overlap with Split's required days above -> contradiction
      (at lyon d6) (at lyon d7) (at lyon d8) (at lyon d9) (at lyon d10) (at lyon d11)
    )
  )
)