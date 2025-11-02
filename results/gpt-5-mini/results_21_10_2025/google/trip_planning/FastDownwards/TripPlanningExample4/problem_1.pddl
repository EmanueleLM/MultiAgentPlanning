(define (problem travel-problem)
  (:domain travel-domain)

  ; Integrated notes / comments:
  ; - Traveler private preferences: Tallinn 2 days, Seville 7 days, Munich 5 days; total 14 (inconsistent with 12-day trip).
  ; - Resolution chosen by the orchestrator: keep Seville = 7 days, Tallinn = 2 days, reduce Munich to 3 days to meet 12-day total.
  ; - Meeting constraint interpretation: "meet a friend in Tallinn between day 11 and day 12" is enforced by placing the traveler in Tallinn on both day11 and day12 (strong interpretation).
  ; - Travel assumption: flights occur between the end of day N and the start of day N+1 and do not consume extra days.
  ; - Direct flights available (from flights_manager): Seville <-> Munich, Munich <-> Tallinn. No direct Seville <-> Tallinn.
  ; - Same-city "direct" relations are included to permit staying in the same city on consecutive days.

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    seville munich tallinn - city
  )

  (:init
    ; Consecutive-day relations
    (day-prev day1 day2)
    (day-prev day2 day3)
    (day-prev day3 day4)
    (day-prev day4 day5)
    (day-prev day5 day6)
    (day-prev day6 day7)
    (day-prev day7 day8)
    (day-prev day8 day9)
    (day-prev day9 day10)
    (day-prev day10 day11)
    (day-prev day11 day12)

    ; Start itinerary in Seville (this is a chosen valid start consistent with direct-flight constraints
    ; and the selected allocation; the planner will then assign remaining days via assign-day actions).
    (assigned day1 seville)

    ; All other days initially free
    (free day2)
    (free day3)
    (free day4)
    (free day5)
    (free day6)
    (free day7)
    (free day8)
    (free day9)
    (free day10)
    (free day11)
    (free day12)

    ; Direct flight connectivity (bidirectional edges as given) and same-city stays
    ; From Seville
    (direct seville seville)
    (direct seville munich)
    ; From Munich
    (direct munich munich)
    (direct munich seville)
    (direct munich tallinn)
    ; From Tallinn
    (direct tallinn tallinn)
    (direct tallinn munich)
  )

  ; Goal: enforce the chosen allocation that satisfies all constraints:
  ; - Exactly 12 days covered
  ; - Seville 7 days, Munich 3 days, Tallinn 2 days
  ; - Tallinn on days 11 and 12 to meet the friend between day 11 and day 12
  ; Note: the goal explicitly lists the per-day assignments matching the chosen allocation so that any plan
  ; that reaches the goal must realize those stays and the allowed direct-flight transitions between consecutive days.
  (:goal
    (and
      ; Seville: days 1-7
      (assigned day1 seville)
      (assigned day2 seville)
      (assigned day3 seville)
      (assigned day4 seville)
      (assigned day5 seville)
      (assigned day6 seville)
      (assigned day7 seville)

      ; Munich: days 8-10 (3 days)
      (assigned day8 munich)
      (assigned day9 munich)
      (assigned day10 munich)

      ; Tallinn: days 11-12 (2 days, meeting enforced)
      (assigned day11 tallinn)
      (assigned day12 tallinn)
    )
  )
)