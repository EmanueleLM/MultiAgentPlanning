(define (problem trip_example_45)
  (:domain trip_planning)
  (:objects
    copenhagen lisbon florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    (at copenhagen)
    (current_day d1)
    (city_count copenhagen c0)
    (city_count lisbon c0)
    (city_count florence c0)
    
    (connected copenhagen lisbon)
    (connected lisbon copenhagen)
    (connected lisbon florence)
    (connected florence lisbon)
    
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15) (next_day d15 d16)
    
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7)
  )
  (:goal (and
    (city_count copenhagen c7)
    (city_count lisbon c7)
    (city_count florence c4)
    (visited copenhagen d1)
    (visited copenhagen d7)
    (current_day d16)
  ))
)