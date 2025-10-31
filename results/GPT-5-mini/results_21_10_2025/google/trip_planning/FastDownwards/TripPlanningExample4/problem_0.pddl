(define (problem travel-problem)
  (:domain travel-domain)

  ; Problem comments:
  ; - Inputs integrated:
  ;   * Traveler preference proposal and three suggested allocations (A, B, C).
  ;   * Flights manager direct-flight connectivity (Seville <-> Munich, Munich <-> Tallinn; no Seville <-> Tallinn).
  ; - Resolution of conflict:
  ;   The traveler's private preferences sum to 14 days but the public trip length is 12 days.
  ;   Per the orchestrator instruction, we choose the traveler's primary suggested allocation (option A):
  ;     Seville 7 days, Munich 3 days, Tallinn 2 days (total = 12).
  ;   This preserves Seville at full preference, trims Munich from 5->3, and places the traveler in Tallinn
  ;   during days 11 and 12 to satisfy the meeting constraint.
  ; - Meeting constraint interpretation:
  ;   "meet a friend in Tallinn between day 11 and day 12" is interpreted as the traveler must be in
  ;   Tallinn on day 11 and/or day 12. We enforce both days 11 and 12 in Tallinn (stronger constraint).
  ; - Travel-day assumption:
  ;   Travel (flight legs) does not consume additional full days beyond the 12-day count (i.e., flights occur
  ;   between end of day N and start of day N+1).
  ; - Direct-flight constraint:
  ;   Only direct flights listed by the flights_manager are allowed for any move between consecutive days.
  ;   A same-city "direct" relation is included to permit staying in the same city from day d to day d+1.
  ; - No additional availability beyond the given data was invented; we used only the provided direct edges.

  (:objects
    ; days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    ; cities
    seville munich tallinn - city
  )

  (:init
    ; Consecutive-day relations (day-prev)
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

    ; Initial assignment: day1 is Seville (we start the itinerary in Seville per the chosen allocation)
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

    ; Flights manager: direct flight connectivity (bidirectional), plus same-city "direct" hops to allow staying
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

    ; Note: there is no (direct seville tallinn) and no (direct tallinn seville) as per flights_manager input.
  )

  (:goal
    (and
      ; Enforce the chosen allocation: days 1-7 Seville, days 8-10 Munich, days 11-12 Tallinn.
      (assigned day1 seville)
      (assigned day2 seville)
      (assigned day3 seville)
      (assigned day4 seville)
      (assigned day5 seville)
      (assigned day6 seville)
      (assigned day7 seville)

      (assigned day8 munich)
      (assigned day9 munich)
      (assigned day10 munich)

      (assigned day11 tallinn)
      (assigned day12 tallinn)
    )
  )
)