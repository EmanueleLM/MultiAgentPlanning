(define (problem visit-three-cities)
  (:domain travel_itinerary)

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

    ;; start: traveler is in Dubrovnik on day 1 (day d1 is already assigned)
    (at dubrovnik d1)
    (assigned d1)

    ;; mark remaining days as free (available to be assigned by actions)
    (free d2)
    (free d3)
    (free d4)
    (free d5)
    (free d6)
    (free d7)
    (free d8)
    (free d9)
    (free d10)
    (free d11)
    (free d12)
  )

  ;; Auditor-adjusted visit durations that sum to the declared total (12 days):
  ;;   dubrovnik: 1 day  (d1)
  ;;   istanbul:  5 days (d2..d6)
  ;;   budapest:  6 days (d7..d12)
  (:goal (and
    ;; Dubrovnik: day 1
    (at dubrovnik d1)

    ;; Istanbul: days 2-6 (5 days)
    (at istanbul d2)
    (at istanbul d3)
    (at istanbul d4)
    (at istanbul d5)
    (at istanbul d6)

    ;; Budapest: days 7-12 (6 days)
    (at budapest d7)
    (at budapest d8)
    (at budapest d9)
    (at budapest d10)
    (at budapest d11)
    (at budapest d12)

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