(define (problem trip-15-days)
  (:domain itinerary)
  (:objects
    valencia amsterdam tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ; Trip initial condition: starting city not yet chosen
    (not_started)

    ; Mark the first day
    (first day1)

    ; Define day successor (consecutive days)
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)

    ; Direct flight connectivity (bidirectional facts)
    (flight valencia amsterdam)
    (flight amsterdam valencia)
    (flight amsterdam tallinn)
    (flight tallinn amsterdam)

    ; Note: No direct flight between Valencia and Tallinn is provided (intentionally absent)
  )

  ; Goals enforce the reconciled plan:
  ; - Total trip length = 15 days implemented by assigning each day a city (days 1..15 become occupied through actions).
  ; - Stays reconciled to sum 15 days: Valencia 5 days, Amsterdam 5 days, Tallinn 5 days (Tallinn reduced from 7 -> 5 as preferred).
  ; - Tallinn stay scheduled as the final leg (days 11-15), ensuring at least one day in Tallinn within day9..day15.
  (:goal
    (and
      ; Valencia days 1-5 (5 days)
      (at valencia day1)
      (at valencia day2)
      (at valencia day3)
      (at valencia day4)
      (at valencia day5)

      ; Amsterdam days 6-10 (5 days)
      (at amsterdam day6)
      (at amsterdam day7)
      (at amsterdam day8)
      (at amsterdam day9)
      (at amsterdam day10)

      ; Tallinn days 11-15 (5 days) — final leg and meets meeting-window constraint (day11..15 subset of day9..15)
      (at tallinn day11)
      (at tallinn day12)
      (at tallinn day13)
      (at tallinn day14)
      (at tallinn day15)
    )
  )
)