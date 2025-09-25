(define (problem trip10)
  (:domain trip_planning)

  ; ---------------------------------------------------------------------
  ; Integration comments and tradeoffs (human-readable explanations inside PDDL comments):
  ; - Public constraints enforced:
  ;   * Only direct flights used: defined flight actions exist only for Dubrovnik<->Frankfurt and Frankfurt<->Krakow.
  ;   * No direct Dubrovnik<->Krakow flight action is provided (forbidden per public info).
  ; - Global hard constraint: total trip length = 10 days.
  ;   We model the progression with a numeric function (day). Start day is 1; finishing after day 10 yields day = 11.
  ; - Krakow_agent preference:
  ;   * Wants 2 days in Krakow and a wedding that occurs between day 9 and day 10.
  ;   * We ensure presence in Krakow starting at day = 9 by requiring the attend-wedding-krakow_agent action when (day) = 9,
  ;     which consumes 2 days (days 9 & 10), producing day = 11 at the end.
  ; - Frankfurt_agent preference:
  ;   * Wants 3 days in Frankfurt. This plan honors the Frankfurt preference and allocates 3 days.
  ; - Dubrovnik_agent preference:
  ;   * Requested 7 days in Dubrovnik (private). With Krakow (2) + Frankfurt (3) = 5 days, honoring all preferences would sum to 12 > 10.
  ;   * To meet the 10-day total, we reduce Dubrovnik time from 7 to 5 days (a tradeoff).
  ; - Rationale of chosen allocation:
  ;   * We preserve the Krakow wedding constraint by scheduling Krakow on days 9-10 (2 days).
  ;   * We preserve Frankfurt's requested 3 days to maintain the hub visits and direct-flight connectivity.
  ;   * Dubrovnik is shortened to 5 days so the overall sum is 10.
  ; - Start city:
  ;   * To construct a concrete, solvable plan consistent with flight connections, we start the trip in Dubrovnik.
  ;   * This is a pragmatic choice to create a valid integrated itinerary; it is documented here as a comment.
  ; ---------------------------------------------------------------------

  (:objects
    krakow frankfurt dubrovnik - city
    krakow_agent dubrovnik_agent frankfurt_agent - agent
  )

  (:init
    (in dubrovnik)     ; chosen starting city (see integration comments above)
    (= (day) 1)
  )

  (:goal
    (and
      (visited dubrovnik)
      (visited frankfurt)
      (visited krakow)
      (= (day) 11)     ; day=11 means days 1..10 were consumed -> total 10 days spent
    )
  )
)