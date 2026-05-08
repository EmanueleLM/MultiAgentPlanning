(define (problem TripPlanningExample37)
  (:domain trip_planning_example37)
  (:objects
    jack_of_all_trades - agent
    reykjavik milan porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    ; Initial agent location (not specified, picking reykjavik as a starting point)
    (at jack_of_all_trades reykjavik)
    ; Initial day
    (current_day d1)
    ; Day sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10)
    ; City connections (direct flights)
    (connected reykjavik milan)
    (connected milan reykjavik)
    (connected milan porto)
    (connected porto milan)
    ; Initial day counts for cities (0 days spent)
    (has_spent_in_reykjavik reykjavik_c0)
    (has_spent_in_porto porto_c0)
    (has_spent_in_milan milan_c0)
    ; Next count mappings for Reykjavik
    (next_reykjavik_count reykjavik_c0 reykjavik_c1)
    (next_reykjavik_count reykjavik_c1 reykjavik_c2)
    (next_reykjavik_count reykjavik_c2 reykjavik_c3)
    (next_reykjavik_count reykjavik_c3 reykjavik_c4)
    (next_reykjavik_count reykjavik_c4 reykjavik_c5)
    (next_reykjavik_count reykjavik_c5 reykjavik_c6)
    ; Next count mappings for Porto
    (next_porto_count porto_c0 porto_c1)
    (next_porto_count porto_c1 porto_c2)
    ; Next count mappings for Milan
    (next_milan_count milan_c0 milan_c1)
    (next_milan_count milan_c1 milan_c2)
    (next_milan_count milan_c2 milan_c3)
    (next_milan_count milan_c3 milan_c4)
    ; Initial cost
    (= (total-cost) 0)
  )
  (:goal (and
    (current_day d10) ; The plan must end with the agent being on day 10
    (has_spent_in_reykjavik reykjavik_c6) ; Hard constraint: 6 days in Reykjavik
    (has_spent_in_porto porto_c2)       ; Hard constraint: 2 days in Porto
    (has_spent_in_milan milan_c4)       ; Hard constraint: 4 days in Milan (This makes the problem unsolvable as it sums to 12 days, exceeding the 10-day total)
    (was_in_porto_on_day9)              ; Hard constraint: Attend show on day 9 (be in Porto)
    (was_in_porto_on_day10)             ; Hard constraint: Attend show on day 10 (be in Porto)
  ))
  (:metric minimize (total-cost))
)