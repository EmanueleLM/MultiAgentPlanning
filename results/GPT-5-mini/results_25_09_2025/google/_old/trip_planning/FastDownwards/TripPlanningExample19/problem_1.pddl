(define (problem orchestrated_trip-problem)
  (:domain orchestrated_trip)

  (:objects
    brussels valencia nice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ; Direct flights (bidirectional as provided)
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    ; Temporal ordering of days
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ; Starting location: traveler is in Brussels on day1
    (in brussels day1)
    (occupied day1)

    ; Precomputed allowed meeting days: between day1 and day6 inclusive
    (meeting-allowed day1)
    (meeting-allowed day2)
    (meeting-allowed day3)
    (meeting-allowed day4)
    (meeting-allowed day5)
    (meeting-allowed day6)

    ; Initial total cost
    (= (total-cost) 0)
  )

  ; We require a concrete schedule that uses only direct flights between different cities
  ; and assigns each day to exactly one city. The following goal encodes the reconciled
  ; day assignment that meets the counted-stay requirements:
  ; - Brussels: 2 days  -> day1 and day6
  ; - Valencia: 3 days  -> day7, day8, day9
  ; - Nice: 4 days      -> day2, day3, day4, day5
  ; This ordering uses only direct flights (brussels<->nice and brussels<->valencia).
  (:goal
    (and
      (in brussels day1)
      (in brussels day6)

      (in nice day2)
      (in nice day3)
      (in nice day4)
      (in nice day5)

      (in valencia day7)
      (in valencia day8)
      (in valencia day9)

      (met-friends)
    )
  )

  (:metric minimize (total-cost))
)