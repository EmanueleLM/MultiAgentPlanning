(define (problem TripPlanningExample36)
  (:domain trip-planning)
  (:objects
    florence munich warsaw - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    dc0 dc1 dc2 dc3 dc4 dc5 dc6 dc7 - day_count_level
  )
  (:init
    (at florence)
    (current_day d0)
    (next_day d0 d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)
    (next_day d11 d12)
    (next_day d12 d13)

    (connected florence munich)
    (connected florence warsaw)

    (days_in_city florence dc0)
    (days_in_city munich dc0)
    (days_in_city warsaw dc0)

    (next_day_count dc0 dc1)
    (next_day_count dc1 dc2)
    (next_day_count dc2 dc3)
    (next_day_count dc3 dc4)
    (next_day_count dc4 dc5)
    (next_day_count dc5 dc6)
    (next_day_count dc6 dc7)
  )
  (:goal (and
    (current_day d13)
    (days_in_city florence dc2)
    (days_in_city warsaw dc7)
    (days_in_city munich dc6)
  ))
)