(define (problem trip_48)
  (:domain trip_planning)
  (:objects
    manchester split geneva - city
    day_1 day_2 day_3 day_4 day_5 - day
  )
  (:init
    ;; Sequence of days
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)

    ;; Starting location and day
    (at_city manchester)
    (current_day day_1)

    ;; Direct flight connections
    ;; Split and Geneva (both directions)
    (can_fly split geneva)
    (can_fly geneva split)
    ;; from Manchester to Split (one direction)
    (can_fly manchester split)
    ;; Manchester and Geneva (both directions)
    (can_fly manchester geneva)
    (can_fly geneva manchester)
  )
  (:goal
    (and
      ;; 2 days in Manchester: Day 1 and Day 2
      (visited manchester day_1)
      (visited manchester day_2)
      
      ;; 2 days in Split: Day 2 and Day 3
      ;; This also satisfies the friend meeting between day 2 and day 3.
      (visited split day_2)
      (visited split day_3)

      ;; 2 days in Geneva: Day 3 and Day 4
      (visited geneva day_3)
      (visited geneva day_4)

      ;; Total trip duration is 4 days (Day 1 to Day 4)
      (current_day day_5)
    )
  )
)