(define (problem trip-berlin-frankfurt-bucharest)
  (:domain trip-planning)

  (:objects
    traveler - person
    Berlin Frankfurt Bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Initial location: traveler is in Berlin on day1 (arrive / start trip)
    (at traveler Berlin day1)

    ;; Next-day relations (discrete days 1..11)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
  )

  ;; Goals encode the mandatory presence and the chosen feasible allocation:
  ;; - Berlin event attendance: traveler must be in Berlin on days 1..7 inclusive.
  ;; - Bucharest: traveler must be in Bucharest on days 8..9 (2 days requirement).
  ;; - Frankfurt: traveler must be in Frankfurt on days 10..11 (allocated 2 days here to fit total length).
  (:goal
    (and
      ;; Berlin days 1-7
      (at traveler Berlin day1)
      (at traveler Berlin day2)
      (at traveler Berlin day3)
      (at traveler Berlin day4)
      (at traveler Berlin day5)
      (at traveler Berlin day6)
      (at traveler Berlin day7)

      ;; Bucharest days 8-9 (2 days)
      (at traveler Bucharest day8)
      (at traveler Bucharest day9)

      ;; Frankfurt days 10-11 (2 days; original "4 days" preference relaxed to fit the trip)
      (at traveler Frankfurt day10)
      (at traveler Frankfurt day11)
    )
  )
)