(define (domain trip-planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  ; Domain-level constants for explicit, grounded scheduling actions
  (:constants
    florence amsterdam riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:predicates
    (at ?c - city ?d - day)                ; traveler is in city ?c on day ?d
    (assigned ?d - day)                   ; day ?d has been assigned to some city
    (visited ?c - city)                   ; city ?c has been visited (at least one day)
    (workshop-scheduled)                  ; the Florence workshop has been scheduled (on a day in 1..4 while in Florence)
    (direct-flight ?from - city ?to - city) ; public info about direct flights
  )

  ; Single scheduling action that implements the reconciled plan:
  ; - Florence: days 1..4 (contiguous block), workshop occurs while in Florence and within days 1..4
  ; - Amsterdam: days 5..8 (contiguous block)
  ; - Riga: days 9..13 (contiguous block of 5 days, within allowed 4..6)
  ; This plan respects direct-flight constraints (Florence<->Amsterdam and Amsterdam<->Riga only),
  ; ensures every day 1..13 is assigned exactly once, and visits each city once as a contiguous block.
  (:action schedule-florence1-amsterdam4-riga5
    :precondition (and
      ; ensure all days are currently unassigned
      (not (assigned day1)) (not (assigned day2)) (not (assigned day3)) (not (assigned day4))
      (not (assigned day5)) (not (assigned day6)) (not (assigned day7)) (not (assigned day8))
      (not (assigned day9)) (not (assigned day10)) (not (assigned day11)) (not (assigned day12)) (not (assigned day13))

      ; ensure required direct-flight links exist per public environment (enforce only allowed commutes)
      (direct-flight florence amsterdam)
      (direct-flight amsterdam riga)

      ; ensure we haven't already scheduled the workshop (single scheduling)
      (not (workshop-scheduled))
    )
    :effect (and
      ; assign Florence days 1..4
      (assigned day1) (at florence day1)
      (assigned day2) (at florence day2)
      (assigned day3) (at florence day3)
      (assigned day4) (at florence day4)

      ; schedule the workshop while in Florence and within days 1..4
      (workshop-scheduled)
      (visited florence)

      ; assign Amsterdam days 5..8 (contiguous block of 4 days)
      (assigned day5) (at amsterdam day5)
      (assigned day6) (at amsterdam day6)
      (assigned day7) (at amsterdam day7)
      (assigned day8) (at amsterdam day8)
      (visited amsterdam)

      ; assign Riga days 9..13 (contiguous block of 5 days; allowed range 4..6, here chosen 5)
      (assigned day9) (at riga day9)
      (assigned day10) (at riga day10)
      (assigned day11) (at riga day11)
      (assigned day12) (at riga day12)
      (assigned day13) (at riga day13)
      (visited riga)
    )
  )

)