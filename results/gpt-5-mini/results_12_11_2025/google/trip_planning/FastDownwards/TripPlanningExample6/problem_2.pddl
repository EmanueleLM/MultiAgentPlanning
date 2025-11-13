(define (problem travel-8days)
  (:domain travel-days)

  ;; Objects: explicit 8-day horizon and three cities.
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    berlin munich dubrovnik - city
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Background and enforced constraints:
  ; - Trip length: exactly 8 days (day1..day8).
  ; - Mandatory: be in Berlin on day1 and day4 (conference).
  ; - Only direct flights allowed: berlin <-> munich, munich <-> dubrovnik.
  ; - Start city (day1) is Berlin.
  ; - At most one assignment per day enforced by (assigned ?d) and action preconditions.
  ; - Auditor-applied hard itinerary (enforced in goal):
  ;     Berlin: days 1..4 (contiguous)
  ;     Munich: day 5
  ;     Dubrovnik: days 6..8 (contiguous)
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:init
    ;; temporal ordering of days (explicit successor relation)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ;; direct flight connectivity (bidirectional edges)
    (connected berlin munich)
    (connected munich berlin)
    (connected munich dubrovnik)
    (connected dubrovnik munich)

    ;; initial known location: day1 in Berlin, day1 is marked assigned.
    (at day1 berlin)
    (assigned day1)
  )

  ;; Goal: force each day to have the required city so the solver must produce
  ;; contiguous stays and valid direct-flight moves only.
  (:goal (and
    (at day1 berlin)
    (at day2 berlin)
    (at day3 berlin)
    (at day4 berlin)
    (at day5 munich)
    (at day6 dubrovnik)
    (at day7 dubrovnik)
    (at day8 dubrovnik)
  ))
)