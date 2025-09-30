(define (problem trip-9-days)
  (:domain travel)
  ; Objects: explicit days and cities
  (:objects
    frankfurt florence valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  ; Initial state:
  ; - Start in Valencia on day1 (to satisfy the hard relatives constraint within days 1-2).
  ; - Mark Valencia visited from the start day.
  ;   (We start in Valencia so the relatives visit window [day1..day2] can be satisfied
  ;    by staying day1->day2.)
  (:init
    (at valencia day1)
    (visited valencia)
    ; Note: no other (at ...) facts are present for other days; they will be produced by actions.
  )

  ; Goal:
  ; The goal encodes the resolved feasible itinerary over the 9-day horizon.
  ; It enforces:
  ;  - Valencia on day1 and day2 (Valencia = 2 days; relatives visit satisfied)
  ;  - Frankfurt on days 3,4,5,6,7 (Frankfurt = 5 days)
  ;  - Florence on days 8,9 (Florence reduced to 2 days to fit the 9-day horizon)
  ; This goal structure enforces the earliest feasible allocation that satisfies the
  ; hard relatives window and preserves Frankfurt 5-day stay.
  (:goal (and
    (at valencia day1)
    (at valencia day2)

    (at frankfurt day3)
    (at frankfurt day4)
    (at frankfurt day5)
    (at frankfurt day6)
    (at frankfurt day7)

    (at florence day8)
    (at florence day9)

    ; Also ensure that each city is visited at least once (redundant given the above,
    ; but explicit to reflect the multi-city visit goal).
    (visited valencia)
    (visited frankfurt)
    (visited florence)
  ))
  ; Comments on conflict resolution:
  ; - Agents requested durations: Frankfurt=5, Florence=4, Valencia=2 (sum 11).
  ; - The 9-day limit makes that impossible. The relatives visit in Valencia between
  ;   day1 and day2 is treated as a strict hard window and therefore preserved.
  ; - To obtain a feasible plan that respects direct-flight constraints and the
  ;   relatives window, we keep Valencia=2 and Frankfurt=5, and reduce Florence to 2.
  ; - The enumerated actions in the domain permit the day-to-day transitions required
  ;   by this schedule:
  ;     day1 (Valencia) --stay--> day2 (Valencia)
  ;     day2 (Valencia) --flight--> day3 (Frankfurt)
  ;     days 3-7 (Frankfurt) --stays-->
  ;     day7 (Frankfurt) --flight--> day8 (Florence)
  ;     day8 (Florence) --stay--> day9 (Florence)
  ; - All flights used are direct and allowed by the provided connectivity.
)