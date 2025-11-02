(define (problem integrated-trip-problem)
  (:domain integrated-trip)

  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    ;; Direct flight connectivity (bidirectional facts as supplied by flight-office)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    ;; Successor chain for 6-day trip
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)

    ;; Initial location on day1
    (at berlin day1)

    ;; Not met at start
    ;; (met-friend) is absent initially
  )

  ;; Feasible concrete schedule goal (sums to 6 days):
  ;; - Berlin: day1, day2 (2 days)
  ;; - Warsaw: day3, day4 (2 days)
  ;; - Bucharest: day5, day6 (2 days)
  ;; Also require meeting the friend in Bucharest (will be achieved on day5 or day6).
  (:goal (and
    (at berlin day1)
    (at berlin day2)
    (at warsaw day3)
    (at warsaw day4)
    (at bucharest day5)
    (at bucharest day6)
    (met-friend)
  ))
)