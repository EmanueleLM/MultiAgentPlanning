(define (problem traveler-itinerary-problem)
  (:domain traveler-itinerary)

  (:objects
    traveler1 - person

    berlin porto krakow - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; day ordering (1..11)
    (trp-next day1 day2)
    (trp-next day2 day3)
    (trp-next day3 day4)
    (trp-next day4 day5)
    (trp-next day5 day6)
    (trp-next day6 day7)
    (trp-next day7 day8)
    (trp-next day8 day9)
    (trp-next day9 day10)
    (trp-next day10 day11)

    ;; declared direct flights (only these directed pairs are allowed)
    (trp-direct-flight berlin porto)
    (trp-direct-flight porto berlin)
    (trp-direct-flight krakow berlin)
    (trp-direct-flight berlin krakow)

    ;; initial condition: traveler starts in Krakow on day1 (day1 is assigned as a stay)
    (trp-at traveler1 krakow day1)
    (trp-assigned day1)
  )

  ;; Goal: a feasible assignment consistent with direct-flight connectivity,
  ;; 11-day horizon, travel-day semantics, and attendance of the Porto wedding (day10).
  ;; This goal matches the auditor's feasible allocation:
  ;; - Krakow stays on days 1-3
  ;; - travel day krakow->berlin on day4
  ;; - Berlin stays on days 5-8
  ;; - travel day berlin->porto on day9
  ;; - Porto stays on days 10-11 (wedding attended on day10)
  ;; - every day 1..11 must be assigned (either a stay or travel)
  (:goal
    (and
      ;; Krakow stays
      (trp-at traveler1 krakow day1)
      (trp-at traveler1 krakow day2)
      (trp-at traveler1 krakow day3)

      ;; travel day krakow->berlin
      (trp-in-transit traveler1 day4)

      ;; Berlin stays
      (trp-at traveler1 berlin day5)
      (trp-at traveler1 berlin day6)
      (trp-at traveler1 berlin day7)
      (trp-at traveler1 berlin day8)

      ;; travel day berlin->porto
      (trp-in-transit traveler1 day9)

      ;; Porto stays (wedding on day10)
      (trp-at traveler1 porto day10)
      (trp-at traveler1 porto day11)

      ;; all days assigned
      (trp-assigned day1)
      (trp-assigned day2)
      (trp-assigned day3)
      (trp-assigned day4)
      (trp-assigned day5)
      (trp-assigned day6)
      (trp-assigned day7)
      (trp-assigned day8)
      (trp-assigned day9)
      (trp-assigned day10)
      (trp-assigned day11)
    )
  )
)