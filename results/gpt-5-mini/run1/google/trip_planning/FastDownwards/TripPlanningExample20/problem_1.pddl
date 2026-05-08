(define (problem visit-three-cities)
  (:domain travel-itinerary)

  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    ;; consecutive day ordering for a 12-day trip
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)

    ;; direct flights (one-way). Provided connectivity:
    ;; Istanbul <-> Budapest (bidirectional)
    ;; Dubrovnik -> Istanbul (one-way)
    (flight istanbul budapest)
    (flight budapest istanbul)
    (flight dubrovnik istanbul)

    ;; start: traveler is in Dubrovnik on day 1
    (in dubrovnik d1)
    (assigned d1)
  )

  ;; Auditor-adjusted visit durations (must sum to 12 total days).
  ;; Chosen adjustment (integral days) that respects connectivity and total:
  ;;   dubrovnik: 1 day  (d1)
  ;;   istanbul:  5 days (d2..d6)
  ;;   budapest:  6 days (d7..d12)
  (:goal (and
    ;; Dubrovnik: day 1
    (in dubrovnik d1)

    ;; Istanbul: days 2-6 (5 days)
    (in istanbul d2)
    (in istanbul d3)
    (in istanbul d4)
    (in istanbul d5)
    (in istanbul d6)

    ;; Budapest: days 7-12 (6 days)
    (in budapest d7)
    (in budapest d8)
    (in budapest d9)
    (in budapest d10)
    (in budapest d11)
    (in budapest d12)

    ;; every day must be assigned (accounting for all 12 days)
    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (assigned d7)
    (assigned d8)
    (assigned d9)
    (assigned d10)
    (assigned d11)
    (assigned d12)
  ))
)