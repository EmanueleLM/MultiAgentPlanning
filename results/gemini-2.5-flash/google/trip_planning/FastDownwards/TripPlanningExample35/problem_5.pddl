(define (problem trip-planning-example35)
  (:domain trip-planning-example35)
  (:objects
    bucharest zurich dubrovnik - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    b0 b1 b2 b3 - bucharest_count
    z0 z1 z2 - zurich_count
    d0 d1 d2 d3 d4 d5 d6 d7 - dubrovnik_count
  )

  (:init
    ; Initial day and location
    (current_day day0)
    (at_city bucharest) ; Arbitrary starting city as problem doesn't specify one.

    ; Day progression
    (next_day day0 day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    ; Flight connections (bidirectional as implied)
    (has_flight bucharest zurich)
    (has_flight zurich bucharest)
    (has_flight zurich dubrovnik)
    (has_flight dubrovnik zurich)

    ; Initial city day counts
    (current_bucharest_count b0)
    (current_zurich_count z0)
    (current_dubrovnik_count d0)

    ; City day count progressions
    (next_bucharest_count b0 b1)
    (next_bucharest_count b1 b2)
    (next_bucharest_count b2 b3)

    (next_zurich_count z0 z1)
    (next_zurich_count z1 z2)

    (next_dubrovnik_count d0 d1)
    (next_dubrovnik_count d1 d2)
    (next_dubrovnik_count d2 d3)
    (next_dubrovnik_count d3 d4)
    (next_dubrovnik_count d4 d5)
    (next_dubrovnik_count d5 d6)
    (next_dubrovnik_count d6 d7)

    ; Relatives visit status
    (not (visited_relatives_in_dubrovnik))

    ; Day window for visiting relatives in Dubrovnik
    (day_is_4_to_10 day4)
    (day_is_4_to_10 day5)
    (day_is_4_to_10 day6)
    (day_is_4_to_10 day7)
    (day_is_4_to_10 day8)
    (day_is_4_to_10 day9)
    (day_is_4_to_10 day10)
  )

  (:goal (and
    (current_day day10) ; The trip must conclude on day 10
    (current_bucharest_count b3) ; Visit Bucharest for 3 days
    (current_zurich_count z2)   ; Visit Zurich for 2 days
    (current_dubrovnik_count d7) ; Spend 7 days in Dubrovnik
    (visited_relatives_in_dubrovnik) ; Visit relatives in Dubrovnik between day 4 and day 10
  ))
)