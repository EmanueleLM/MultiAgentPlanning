(define (problem itinerary-6days)
  (:domain travel-multi-agent)
  (:objects
    traveler - person
    Berlin Warsaw Bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    ;; day progression
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)

    ;; initial location assumption: start in Berlin on day1
    (at traveler Berlin day1)
  )

  ;; Goals enforce the per-city per-day presences (ensures stays sum to 6 days),
  ;; and meeting requirement (presence in Bucharest on day5, earliest slot).
  (:goal
    (and
      ;; Berlin stay: days 1-2
      (at traveler Berlin day1)
      (at traveler Berlin day2)

      ;; Warsaw stay: days 3-4
      (at traveler Warsaw day3)
      (at traveler Warsaw day4)

      ;; Bucharest stay: days 5-6
      (at traveler Bucharest day5)
      (at traveler Bucharest day6)

      ;; Meeting requirement satisfied by being in Bucharest on day5 (earliest)
      (at traveler Bucharest day5)
    )
  )
)