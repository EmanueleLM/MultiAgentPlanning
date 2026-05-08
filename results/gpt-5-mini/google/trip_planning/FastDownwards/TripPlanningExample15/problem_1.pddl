(define (problem traveler-itinerary-problem)
  (:domain traveler-itinerary)
  (:objects
    traveler1 - person

    berlin porto krakow - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; day ordering
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

    ;; declared direct flights (only these are allowed)
    ;; connectivity provided in both directions where applicable
    (trp-direct-flight berlin porto)
    (trp-direct-flight porto berlin)
    (trp-direct-flight krakow berlin)
    (trp-direct-flight berlin krakow)

    ;; initial condition: traveler starts in Krakow on day1
    (trp-at traveler1 krakow day1)
    (trp-assigned day1)
  )

  ;; Goal encoding:
  ;; The auditor found the original requested stays (Berlin 6, Porto 2, Krakow 5) plus required travel days was infeasible
  ;; within the 11-day horizon. The following feasible allocation was chosen to respect the wedding in Porto (day10)
  ;; while keeping stays contiguous and using only declared direct flights:
  ;; - Krakow: days 1,2,3
  ;; - travel (krakow->berlin): day4 (in-transit)
  ;; - Berlin: days 5,6,7,8
  ;; - travel (berlin->porto): day9 (in-transit)
  ;; - Porto: days 10,11  (wedding attendance enforced on day10)
  ;;
  ;; The goal also requires all days to be assigned (either a stay or a travel day).
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

      ;; Porto stays (wedding attended on day10)
      (trp-at traveler1 porto day10)
      (trp-at traveler1 porto day11)

      ;; full assignment of each day ensures no unassigned days remain
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