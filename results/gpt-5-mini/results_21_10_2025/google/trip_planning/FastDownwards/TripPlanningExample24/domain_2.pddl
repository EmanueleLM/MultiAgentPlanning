(define (domain trip-planner)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:constants
    florence amsterdam riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:predicates
    (at ?c - city ?d - day)                 ; traveler is in city ?c on day ?d
    (assigned ?d - day)                    ; day ?d has been assigned to some city
    (visited ?c - city)                    ; city ?c has been visited (at least one day)
    (workshop-scheduled)                   ; the Florence workshop has been scheduled (on a day in 1..4 while in Florence)
    (direct-flight ?from - city ?to - city) ; public info about direct flights
  )

  ; Single atomic scheduling action that encodes the deduced feasible plan.
  ; This action assigns every day to the correct city, marks each city visited,
  ; and schedules the Florence workshop (on one of days 1..4 while in Florence).
  ; Preconditions ensure days are unassigned, required direct flights exist, and workshop not yet scheduled.
  (:action schedule-florence1-4-amsterdam5-8-riga9-13
    :parameters ()
    :precondition (and
      (not (assigned day1)) (not (assigned day2)) (not (assigned day3)) (not (assigned day4))
      (not (assigned day5)) (not (assigned day6)) (not (assigned day7)) (not (assigned day8))
      (not (assigned day9)) (not (assigned day10)) (not (assigned day11)) (not (assigned day12)) (not (assigned day13))

      ;; enforce that only the allowed direct flights (Florence<->Amsterdam and Amsterdam<->Riga) exist
      (direct-flight florence amsterdam)
      (direct-flight amsterdam florence)
      (direct-flight amsterdam riga)
      (direct-flight riga amsterdam)

      ;; ensure the workshop hasn't already been scheduled
      (not (workshop-scheduled))
    )
    :effect (and
      ;; Assign Florence days 1..4 and mark presence
      (assigned day1) (at florence day1)
      (assigned day2) (at florence day2)
      (assigned day3) (at florence day3)
      (assigned day4) (at florence day4)
      (visited florence)

      ;; Schedule the workshop while in Florence within days 1..4
      (workshop-scheduled)

      ;; Assign Amsterdam days 5..8 and mark presence
      (assigned day5) (at amsterdam day5)
      (assigned day6) (at amsterdam day6)
      (assigned day7) (at amsterdam day7)
      (assigned day8) (at amsterdam day8)
      (visited amsterdam)

      ;; Assign Riga days 9..13 and mark presence
      (assigned day9)  (at riga day9)
      (assigned day10) (at riga day10)
      (assigned day11) (at riga day11)
      (assigned day12) (at riga day12)
      (assigned day13) (at riga day13)
      (visited riga)
    )
  )
)