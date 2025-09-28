(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 - day
    London Bucharest Riga - city
  )

  (:init
    ; day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)

    ; direct flight graph (only these direct legs are allowed)
    (direct London Bucharest)
    (direct Bucharest London)
    (direct Bucharest Riga)
    (direct Riga Bucharest)

    ; allowed workshop days (Riga workshop must be attended between day5 and day8)
    (allowed-workshop-day day5)
    (allowed-workshop-day day6)
    (allowed-workshop-day day7)
    (allowed-workshop-day day8)

    ; starting location (earliest-feasible assumption consistent with preferences)
    (at day1 London)
  )

  ; Goals encode the agreed coherent 8-day allocation and the hard workshop constraint:
  ; - London: days 1-2
  ; - Bucharest: days 3-4
  ; - Riga: days 5-8 (includes workshop attendance in allowed interval)
  (:goal (and
    (at day1 London)
    (at day2 London)
    (at day3 Bucharest)
    (at day4 Bucharest)
    (at day5 Riga)
    (at day6 Riga)
    (at day7 Riga)
    (at day8 Riga)
    (attended-workshop)
  ))
)