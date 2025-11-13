(define (problem travel-8days)
  (:domain travel-days)

  ;; Objects: an explicit 8-day horizon and three cities.
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    Berlin Munich Dubrovnik - city
  )

  ;; Soft preferences and auditor relaxations are encoded here as comments (treated as constraints elsewhere):
  ; Soft preferences (treated as hard constraints for this model per instructions):
  ; - Preferred days requested: Berlin:4, Munich:3, Dubrovnik:3 (sum 10 > 8) -> auditor relaxes to fit 8-day trip.
  ; Auditor's recommended relaxations applied:
  ; - Preserve Berlin preferred count = 4 days (days 1,2,3,4), keep fixed conference days day1 & day4 in Berlin.
  ; - Allocate remaining days preferentially to Dubrovnik before Munich.
  ; - Resulting recommended itinerary (enforced exactly as hard constraints in the goal):
  ;   day1: Berlin (fixed)
  ;   day2: Berlin
  ;   day3: Berlin
  ;   day4: Berlin (fixed)
  ;   day5: Munich
  ;   day6: Dubrovnik
  ;   day7: Dubrovnik
  ;   day8: Dubrovnik
  ;
  ; Flight graph (direct flights only, bidirectional edges):
  ; - Berlin <-> Munich
  ; - Munich <-> Dubrovnik
  ; There is no direct Berlin <-> Dubrovnik flight; transfers must go via Munich.
  ;
  ; "Max one flight per day" was not specified by the traveler; this model allows at most one assignment per day
  ; by construction (each day is assigned exactly once), and moves correspond to single day-to-day flights.

  (:init
    ; temporal ordering of days
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ; flight connectivity (bidirectional/direct edges)
    (connected Berlin Munich)
    (connected Munich Berlin)
    (connected Munich Dubrovnik)
    (connected Dubrovnik Munich)

    ; initial assignment: day1 is in Berlin (conference day), and marked assigned.
    (at day1 Berlin)
    (assigned day1)

    ; Note: other days are initially unassigned; actions will assign cities to each subsequent day.
  )

  ;; Goal: enforce the auditor's recommended itinerary exactly (hard constraints).
  (:goal (and
    (at day1 Berlin)
    (at day2 Berlin)
    (at day3 Berlin)
    (at day4 Berlin)
    (at day5 Munich)
    (at day6 Dubrovnik)
    (at day7 Dubrovnik)
    (at day8 Dubrovnik)
  ))
)