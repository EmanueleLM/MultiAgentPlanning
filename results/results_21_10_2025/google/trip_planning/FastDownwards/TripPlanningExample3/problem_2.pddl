(define (problem trip-6days-example3)
  (:domain trip-planning-example3)
  (:objects
    berlin warsaw bucharest - city
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
    (connected berlin warsaw)
    (connected warsaw berlin)
    (connected warsaw bucharest)
    (connected bucharest warsaw)

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
      (visited berlin)
      (visited warsaw)
      (visited bucharest)

      ;; Bucharest hard constraint: stay in Bucharest for 2 days.
      ;; Enforce that day5 and day6 the traveler is located in Bucharest (these represent the two Bucharest stay days).
      (located bucharest day5)
      (located bucharest day6)

      ;; Meeting requirement in Bucharest between day5 and day6.
      (meeting bucharest day6)
    )
  )
)