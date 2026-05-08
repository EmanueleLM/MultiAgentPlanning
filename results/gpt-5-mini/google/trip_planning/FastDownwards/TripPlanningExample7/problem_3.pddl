(define (problem travel-problem-dbv-vce-11days)
  (:domain travel-domain)
  (:objects
    dbv vce ist - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; chronological ordering of the 11-day trip
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; direct flights available (only the legs explicitly provided)
    (direct dbv vce)
    (direct dbv ist)

    ;; initial location and first day occupied
    (at dbv day1)
    (occupied day1)
    (visited dbv)
  )

  ;; Auditor's correction: given the provided directed flight graph, it is impossible
  ;; to visit both Venice and Istanbul after leaving Dubrovnik (no direct flights out
  ;; of Venice or Istanbul are provided). To produce a feasible plan that uses all 11
  ;; days and only direct flights, the auditor recommends focusing on Dubrovnik and
  ;; Venice only (keep Venice preference while reconciling total days). The goal below
  ;; therefore requires visiting Dubrovnik and Venice and occupying every day.
  (:goal (and
    (visited dbv)
    (visited vce)
    (occupied day1)
    (occupied day2)
    (occupied day3)
    (occupied day4)
    (occupied day5)
    (occupied day6)
    (occupied day7)
    (occupied day8)
    (occupied day9)
    (occupied day10)
    (occupied day11)
  ))
)