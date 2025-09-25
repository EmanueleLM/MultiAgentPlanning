(define (domain trip-multiagent)
  (:requirements :strips :typing :fluents :negative-preconditions :adl)
  (:types city)

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (attended-wedding)
  )

  (:functions
    (day)
    (days_in_reykjavik)
    (days_in_vienna)
    (days_in_venice)
  )

  (:action reykjavik_planner-stay-reykjavik
    :parameters ()
    :precondition (and
      (at reykjavik)
      (< (day) 11)
      (< (days_in_reykjavik) 2)
    )
    :effect (and
      (increase (day) 1)
      (increase (days_in_reykjavik) 1)
      (at reykjavik)
    )
  )

  (:action reykjavik_planner-fly-reykjavik-vienna
    :parameters ()
    :precondition (and
      (at reykjavik)
      (flight reykjavik vienna)
    )
    :effect (and
      (not (at reykjavik))
      (at vienna)
    )
  )

  (:action vienna_planner-stay-vienna
    :parameters ()
    :precondition (and
      (at vienna)
      (< (day) 11)
      (< (days_in_vienna) 5)
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
      (< (days_in_venice) 4)
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
      (>= (day) 8)
      (<= (day) 11)
    )
    :effect (and
      (attended-wedding)
    )
  )
)