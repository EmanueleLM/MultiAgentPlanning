(define (problem trip-6days)
  (:domain trip-planning)
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

    ;; direct flight (symmetric) connections as provided
    (connected Berlin Warsaw)
    (connected Warsaw Berlin)
    (connected Warsaw Bucharest)
    (connected Bucharest Warsaw)

    ;; No other fluents asserted: days start unassigned, no locations, no travel-days, no meetings.
  )

  ;; Goals encode the hard constraints:
  ;; - Total trip length = 6 days (all six days assigned)
  ;; - Each city is visited at least once (here encoded by assigning specific days to each city)
  ;; - Bucharest must be visited 2 days (day5 & day6) and include a meeting between day5 and day6 (meeting on day6)
  ;; - Prevent conflicting full-day meetings implicitly via action preconditions (only one scheduled per day)
  (:goal
    (and
      ;; all six days assigned
      (day-assigned day1)
      (day-assigned day2)
      (day-assigned day3)
      (day-assigned day4)
      (day-assigned day5)
      (day-assigned day6)

      ;; Fixed day-by-day allocation consistent with a linear, direct-flight feasible plan:
      ;; Candidate A style: Berlin days 1-2, travel day3 -> Warsaw, Warsaw day4, travel day5 -> Bucharest, Bucharest day6
      (located Berlin day1)
      (located Berlin day2)

      (located Warsaw day3)
      (located Warsaw day4)

      (located Bucharest day5)
      (located Bucharest day6)

      ;; Bucharest meeting required between day5 and day6 -> enforce full meeting on day6 in Bucharest
      (full-meeting Bucharest day6)
    )
  )
)