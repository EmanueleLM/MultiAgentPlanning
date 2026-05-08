(define (problem trip_planning_example39_p)
  (:domain trip_planning_example39)
  (:objects
    porto barcelona florence - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d_end - day
    pc0 pc1 pc2 pc3 - porto_day_count
    bc0 bc1 bc2 bc3 bc4 bc5 bc6 bc7 - barcelona_day_count
    fc0 fc1 fc2 fc3 fc4 - florence_day_count
  )
  (:init
    (current_day d0)
    (at_city porto) ; Arbitrarily starting in Porto as no specific start city is given

    (num_days_porto pc0)
    (num_days_barcelona bc0)
    (num_days_florence fc0)

    ; Day progression (12 days total, d_end is after d11 passes)
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
    (next_day d11 d_end) ; Marks the state after 12 days have passed

    ; Porto day count progression (3 days total required)
    (next_porto_count pc0 pc1)
    (next_porto_count pc1 pc2)
    (next_porto_count pc2 pc3)

    ; Barcelona day count progression (7 days total required)
    (next_barcelona_count bc0 bc1)
    (next_barcelona_count bc1 bc2)
    (next_barcelona_count bc2 bc3)
    (next_barcelona_count bc3 bc4)
    (next_barcelona_count bc4 bc5)
    (next_barcelona_count bc5 bc6)
    (next_barcelona_count bc6 bc7)

    ; Florence day count progression (4 days total required)
    (next_florence_count fc0 fc1)
    (next_florence_count fc1 fc2)
    (next_florence_count fc2 fc3)
    (next_florence_count fc3 fc4)

    ; Direct flights (bidirectional)
    (has_flight porto barcelona)
    (has_flight barcelona porto)
    (has_flight barcelona florence)
    (has_flight florence barcelona)

    ; Porto relatives visit window (day 1 to day 3, 0-indexed: d0, d1, d2)
    (porto_relatives_window d0)
    (porto_relatives_window d1)
    (porto_relatives_window d2)
  )
  (:goal (and
    (current_day d_end) ; Ensures 12 full days have passed
    (num_days_porto pc3) ; 3 days in Porto
    (num_days_barcelona bc7) ; 7 days in Barcelona
    (num_days_florence fc4) ; 4 days in Florence
    (relatives_visited_in_porto) ; Relatives visited in Porto
  ))