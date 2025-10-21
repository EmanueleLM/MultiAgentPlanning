(define (problem trip-9days)
  (:domain trip-planning)

  (:objects
    nice brussels valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ; Direct flights (bidirectional edges as provided)
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

    ; Allowed meeting days in Nice (day1..day6)
    (allowed-meet day1)
    (allowed-meet day2)
    (allowed-meet day3)
    (allowed-meet day4)
    (allowed-meet day5)
    (allowed-meet day6)

    ; Start location: begin in Nice on day1 (visited day1)
    (at nice day1)
    (visited nice day1)
  )

  ; Goal encodes the required stays by city totals across the 9 days and requires meeting in Nice.
  ; This enforces the reconciled allocation: Nice 4 days, Brussels 2 days, Valencia 3 days (total 9).
  (:goal
    (and
      ; Nice should be visited on days 1..4 (4 days)
      (visited nice day1)
      (visited nice day2)
      (visited nice day3)
      (visited nice day4)

      ; Brussels should be visited on days 5..6 (2 days)
      (visited brussels day5)
      (visited brussels day6)

      ; Valencia should be visited on days 7..9 (3 days)
      (visited valencia day7)
      (visited valencia day8)
      (visited valencia day9)

      ; Meeting in Nice must have occurred on an allowed day (some day between day1..day6 while at nice)
      (met)
    )
  )
)