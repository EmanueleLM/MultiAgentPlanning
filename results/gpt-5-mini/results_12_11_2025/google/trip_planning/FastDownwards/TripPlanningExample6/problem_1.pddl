(define (problem travel-8days)
  (:domain travel-days)

  ;; Objects: explicit 8-day horizon and three cities.
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    berlin munich dubrovnik - city
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Background and auditor notes:
  ; - Trip length: exactly 8 days.
  ; - Hard constraints:
  ;     * Must be in Berlin on day1 and on day4 (conference).
  ;     * Only direct flights allowed: berlin <-> munich, munich <-> dubrovnik.
  ;     * Start city (day1) is Berlin.
  ;     * At most one assignment per day enforced by 'assigned' token and action preconditions.
  ; - Traveler preferences (original, sum>8) were relaxed by auditor:
  ;     * Keep Berlin = 4 days and fixed conference days day1 & day4.
  ;     * Allocate remaining days preferentially to Dubrovnik before Munich.
  ; - Auditor's enforced counts (applied as hard constraints here):
  ;     * Berlin: 4 days (days 1-4)
  ;     * Dubrovnik: 3 days
  ;     * Munich: 1 day
  ; - The domain and problem encode only direct flights. There is no direct berlin <-> dubrovnik edge.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:init
    ;; temporal ordering of days
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

    ;; initial known location: day1 in Berlin, and day1 is marked assigned.
    (at day1 berlin)
    (assigned day1)
  )

  ;; Goal: force all days to be assigned with the auditor-recommended distribution
  ;; (Berlin for days 1..4, Munich day5, Dubrovnik days6..8).
  ;; These are encoded as explicit hard constraints to ensure the only satisfying plan
  ;; conforms to direct-flight connectivity and the one-flight-per-day rule.
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