(define (problem trip-venice-dublin-porto)
  (:domain itinerary-direct-flights)
  (:objects
    venice dublin porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    ;; All days initially free
    (free day1) (free day2) (free day3) (free day4) (free day5)
    (free day6) (free day7) (free day8) (free day9) (free day10)

    ;; Day ordering
    (prev day1 day2) (prev day2 day3) (prev day3 day4) (prev day4 day5)
    (prev day5 day6) (prev day6 day7) (prev day7 day8) (prev day8 day9) (prev day9 day10)

    ;; Mark day1 as the start slot
    (start day1)

    ;; Direct flight links (bidirectional per provided information)
    (direct dublin porto)
    (direct porto dublin)
    (direct venice dublin)
    (direct dublin venice)
  )

  ;; Goals (explicit resolved feasible itinerary)
  ;; Enforce Venice days 1-4 (to satisfy traveler and friends)
  ;; Enforce Dublin days 5-6 (reduced from 4 to 2 to resolve contradiction)
  ;; Enforce Porto days 7-10 (4 days)
  (:goal (and
    (assigned day1 venice)
    (assigned day2 venice)
    (assigned day3 venice)
    (assigned day4 venice)

    (assigned day5 dublin)
    (assigned day6 dublin)

    (assigned day7 porto)
    (assigned day8 porto)
    (assigned day9 porto)
    (assigned day10 porto)
  ))
)