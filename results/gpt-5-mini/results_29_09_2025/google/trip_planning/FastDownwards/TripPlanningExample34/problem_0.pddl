(define (problem trip-problem)
  (:domain trip-domain)

  ; Objects: cities and discrete days (d1..d9)
  (:objects
    frankfurt florence valencia
    d1 d2 d3 d4 d5 d6 d7 d8 d9
  )

  ; Initial state:
  ; - Start at day 1 and (for earliest feasible meeting slot and to satisfy Valencia relatives window)
  ;   the traveler is in Valencia on day 1.
  ; - next relations encode the 9-day horizon as a linear chain d1->d2->...->d9
  ; - direct flights (only those provided by the agents): Frankfurt<->Florence and Frankfurt<->Valencia
  ;
  ; Conflict resolution comment:
  ; - The agents requested stays sum to 11 days (Frankfurt 5 + Florence 4 + Valencia 2) which exceeds the 9-day horizon.
  ; - Valencia's relatives visit window (must occur between day 1 and day 2) is an absolute hard window and thus preserved.
  ; - Frankfurt's requested 5-day stay is preserved as a hard constraint.
  ; - To make the plan feasible within 9 days while preserving the hard Valencia window and Frankfurt's 5 days,
  ;   Florence's stay has been reduced from the requested 4 days to 2 days (the latest days of the plan).
  ; - The resulting explicit allocation (used below) is:
  ;     Valencia: days d1, d2  (2 days; relatives visit satisfied within d1..d2)
  ;     Frankfurt: days d3..d7 (5 days)
  ;     Florence: days d8..d9 (2 days)
  ;
  ; This allocation respects direct-flight connectivity (Valencia -> Frankfurt -> Florence)
  ; and uses only direct flights allowed by the agents. Flights are modeled as taking one day.
  (:init
    ; start on day 1
    (current-day d1)

    ; initial location: start in Valencia on day 1 to satisfy earliest feasible relatives visit window
    (at valencia d1)

    ; linear day successors
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ; direct flights (explicit, no direct flight between Valencia and Florence)
    (flight frankfurt florence)
    (flight florence frankfurt)
    (flight frankfurt valencia)
    (flight valencia frankfurt)
  )

  ; Goal: ensure the traveler is at the specified cities on each required day,
  ; encoding the chosen feasible allocation that satisfies hard constraints:
  ; - Valencia on d1 and d2 (relatives visit must occur within day1..day2)
  ; - Frankfurt on days d3,d4,d5,d6,d7 (Frankfurt's requested 5 days preserved)
  ; - Florence on days d8 and d9 (Florence's stay reduced to 2 days to fit 9-day horizon)
  (:goal
    (and
      ; Valencia required presence for days 1..2 (relatives window)
      (at valencia d1)
      (at valencia d2)

      ; Frankfurt presence days 3..7 (5 days as requested)
      (at frankfurt d3)
      (at frankfurt d4)
      (at frankfurt d5)
      (at frankfurt d6)
      (at frankfurt d7)

      ; Florence presence days 8..9 (reduced to fit the 9-day horizon)
      (at florence d8)
      (at florence d9)
    )
  )

  ; Metric not used: classical plan search aims to reach goal within provided horizon.
)