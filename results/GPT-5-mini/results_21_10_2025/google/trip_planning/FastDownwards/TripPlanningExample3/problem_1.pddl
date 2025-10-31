(define (problem trip-6days-example3)
  (:domain trip-planning-example3)
  (:objects
    Berlin Warsaw Bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    ;; day order
    (prev day1 day2)
    (prev day2 day3)
    (prev day3 day4)
    (prev day4 day5)
    (prev day5 day6)

    ;; direct flight connections (symmetric)
    (connected Berlin Warsaw)
    (connected Warsaw Berlin)
    (connected Warsaw Bucharest)
    (connected Bucharest Warsaw)

    ;; No days assigned initially; no locations initially; visited/meeting/travel-day are false by default.
  )

  (:goal
    (and
      ;; All six days must be assigned (total trip length = 6 days).
      (day-assigned day1)
      (day-assigned day2)
      (day-assigned day3)
      (day-assigned day4)
      (day-assigned day5)
      (day-assigned day6)

      ;; Each city must be visited at least once (hard requirement).
      (visited Berlin)
      (visited Warsaw)
      (visited Bucharest)

      ;; Bucharest hard constraint: stay in Bucharest for 2 days.
      ;; Enforce that day5 and day6 the traveler is located in Bucharest (these represent the two Bucharest stay days).
      (located Bucharest day5)
      (located Bucharest day6)

      ;; Meeting requirement in Bucharest between day5 and day6.
      ;; To make this precise and enforceable in STRIPS-safe way, require a meeting in Bucharest on day6 (a day between or at the end of the span day5-day6).
      (meeting Bucharest day6)
    )
  )
)