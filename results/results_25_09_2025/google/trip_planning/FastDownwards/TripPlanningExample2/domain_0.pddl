(define (domain trip-multiagent)
  (:requirements :strips :typing :fluents :negative-preconditions :adl)
  (:types city)

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (attended-wedding)
  )

  (:functions
    (day)                       ; number of days spent so far (0..11)
    (days_in_reykjavik)
    (days_in_vienna)
    (days_in_venice)
  )

  ;; Actions produced by reykjavik_planner (kept distinct by prefix)
  (:action reykjavik_planner-stay-reykjavik
    :parameters ()
    :precondition (and
      (at reykjavik)
      (< (day) 11)
      (< (days_in_reykjavik) 2)   ; private requirement: visit Reykjavik exactly 2 days (incrementally enforced)
    )
    :effect (and
      (increase (day) 1)
      (increase (days_in_reykjavik) 1)
      (at reykjavik)             ; remain in Reykjavik
    )
  )

  (:action reykjavik_planner-fly-reykjavik-vienna
    :parameters ()
    :precondition (and
      (at reykjavik)
      (flight reykjavik vienna)  ; direct flight known
    )
    :effect (and
      (not (at reykjavik))
      (at vienna)
    )
  )

  ;; Actions produced by vienna_planner (kept distinct by prefix)
  (:action vienna_planner-stay-vienna
    :parameters ()
    :precondition (and
      (at vienna)
      (< (day) 11)
      (< (days_in_vienna) 5)     ; reconciled allocation: Vienna will take 5 days so total fits 11
    )
    :effect (and
      (increase (day) 1)
      (increase (days_in_vienna) 1)
      (at vienna)
    )
  )

  (:action vienna_planner-fly-vienna-reykjavik
    :parameters ()
    :precondition (and
      (at vienna)
      (flight vienna reykjavik)
    )
    :effect (and
      (not (at vienna))
      (at reykjavik)
    )
  )

  (:action vienna_planner-fly-vienna-venice
    :parameters ()
    :precondition (and
      (at vienna)
      (flight vienna venice)
    )
    :effect (and
      (not (at vienna))
      (at venice)
    )
  )

  (:action vienna_planner-stay-venice
    :parameters ()
    :precondition (and
      (at venice)
      (< (day) 11)
      (< (days_in_venice) 4)     ; Venice desired 4 days
    )
    :effect (and
      (increase (day) 1)
      (increase (days_in_venice) 1)
      (at venice)
    )
  )

  (:action vienna_planner-attend-wedding-in-venice
    :parameters ()
    :precondition (and
      (at venice)
      (>= (day) 8)               ; wedding must be attended between day 8 and day 11 (inclusive)
      (<= (day) 11)
    )
    :effect (attended-wedding)
  )
)