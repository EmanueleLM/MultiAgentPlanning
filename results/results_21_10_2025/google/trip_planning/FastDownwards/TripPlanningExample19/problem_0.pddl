; Problem: 9-day trip visiting Nice, Brussels, Valencia with meeting constraint satisfied in Nice between day1..day6
; Assumptions / reconciliation used in the problem:
; - The user's original requested stays (Nice 6, Brussels 2, Valencia 3 = 11 days) were impossible within a 9-day trip.
; - The orchestrator assumption accepted by this problem: reduce Nice from 6 days to 4 days, keeping Brussels = 2 days and Valencia = 3 days.
; - Trip start is Nice on day1.
; - The chosen sequence consistent with direct-flight-only constraint is Nice (days 1-4) -> Brussels (days 5-6) -> Valencia (days 7-9).
; - Direct flights encoded: Brussels <-> Valencia and Brussels <-> Nice (both directions). No Nice <-> Valencia direct flight.
(define (problem trip-9days)
  (:domain trip-planning)

  (:objects
    nice brussels valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ; Direct flights (bidirectional where provided)
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    ; Day succession
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ; Meeting allowed days in Nice: day1..day6 inclusive
    (allowed-meet day1)
    (allowed-meet day2)
    (allowed-meet day3)
    (allowed-meet day4)
    (allowed-meet day5)
    (allowed-meet day6)

    ; Initial location: start in Nice on day1
    (at nice day1)
    (visited nice day1)
  )

  (:goal
    (and
      ; Enforce the adjusted stay allocation by requiring that the traveler visits the specified city on the specified day ranges:
      ; Nice days 1-4
      (visited nice day1)
      (visited nice day2)
      (visited nice day3)
      (visited nice day4)

      ; Brussels days 5-6
      (visited brussels day5)
      (visited brussels day6)

      ; Valencia days 7-9 (final day is day9 in Valencia)
      (visited valencia day7)
      (visited valencia day8)
      (visited valencia day9)

      ; Meeting in Nice must have occurred on some allowed day (planner will schedule meet-in-nice on one of day1..day6 while at nice)
      (met)
    )
  )
)