(define (problem integrated-11-day-trip-17)
  (:domain trip-orchestration-17)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; day succession chain
    (day_next day1 day2)
    (day_next day2 day3)
    (day_next day3 day4)
    (day_next day4 day5)
    (day_next day5 day6)
    (day_next day6 day7)
    (day_next day7 day8)
    (day_next day8 day9)
    (day_next day9 day10)
    (day_next day10 day11)

    ;; direct flights (available edges)
    (direct_flight copenhagen vienna)
    (direct_flight vienna copenhagen)
    (direct_flight vienna lyon)
    (direct_flight lyon vienna)

    ;; Trip starts in Copenhagen on day1 (conference day)
    (at copenhagen day1)
    (visited day1)
  )

  ;; Chosen reconciled itinerary (preserves mandatory Copenhagen conferences on day1 and day5,
  ;; uses only direct flights, and fits 11 days):
  ;; Copenhagen: days 1-5
  ;; Vienna: days 6-9
  ;; Lyon: days 10-11
  (:goal (and
    ;; Copenhagen stay including mandatory conference days
    (at copenhagen day1)
    (at copenhagen day2)
    (at copenhagen day3)
    (at copenhagen day4)
    (at copenhagen day5)

    ;; Vienna stay
    (at vienna day6)
    (at vienna day7)
    (at vienna day8)
    (at vienna day9)

    ;; Lyon stay
    (at lyon day10)
    (at lyon day11)

    ;; ensure each day of the 11-day trip is assigned (traveler somewhere)
    (visited day1)
    (visited day2)
    (visited day3)
    (visited day4)
    (visited day5)
    (visited day6)
    (visited day7)
    (visited day8)
    (visited day9)
    (visited day10)
    (visited day11)
  ))
)