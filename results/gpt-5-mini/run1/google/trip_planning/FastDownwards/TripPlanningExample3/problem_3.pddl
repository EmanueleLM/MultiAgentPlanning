(define (problem trip-ber-waw-buc-6days)
  (:domain trip-planning)

  (:objects
    berlin warsaw bucharest - city
    d1 d2 d3 d4 d5 d6 - day
  )

  (:init
    (day d1) (day d2) (day d3) (day d4) (day d5) (day d6)

    (day-succ d1 d2)
    (day-succ d2 d3)
    (day-succ d3 d4)
    (day-succ d4 d5)
    (day-succ d5 d6)

    ; direct-flight connectivity (symmetric edges provided explicitly)
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)
  )

  ; The following goals faithfully encode the hard requirements extracted from the human specification:
  ; - Berlin for 3 full days (here mapped to days d1,d2,d3)
  ; - Warsaw for 3 full days (here mapped to days d4,d5,d6)
  ; - Bucharest for 2 full days (d5,d6) to satisfy the meeting-window constraint between day 5 and day 6.
  ; These constraints are collectively inconsistent with the total-duration = 6 days (they require 8 day-assignments),
  ; so the problem is unsolvable as modeled — the inconsistency is intentionally preserved.
  (:goal
    (and
      (in berlin d1)
      (in berlin d2)
      (in berlin d3)

      (in warsaw d4)
      (in warsaw d5)
      (in warsaw d6)

      (in bucharest d5)
      (in bucharest d6)
    )
  )
)