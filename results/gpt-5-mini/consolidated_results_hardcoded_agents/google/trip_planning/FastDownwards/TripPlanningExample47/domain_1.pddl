(define (domain trip-domain)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (day-assigned ?d - day)
  )

  (:action stay-paris-d2
    :parameters ()
    :precondition (and (at paris d1) (not (day-assigned d2)))
    :effect (and (at paris d2) (day-assigned d2))
  )
  (:action stay-paris-d3
    :parameters ()
    :precondition (and (at paris d2) (not (day-assigned d3)))
    :effect (and (at paris d3) (day-assigned d3))
  )
  (:action stay-paris-d4
    :parameters ()
    :precondition (and (at paris d3) (not (day-assigned d4)))
    :effect (and (at paris d4) (day-assigned d4))
  )
  (:action stay-paris-d5
    :parameters ()
    :precondition (and (at paris d4) (not (day-assigned d5)))
    :effect (and (at paris d5) (day-assigned d5))
  )
  (:action stay-paris-d6
    :parameters ()
    :precondition (and (at paris d5) (not (day-assigned d6)))
    :effect (and (at paris d6) (day-assigned d6))
  )
  (:action stay-paris-d7
    :parameters ()
    :precondition (and (at paris d6) (not (day-assigned d7)))
    :effect (and (at paris d7) (day-assigned d7))
  )

  (:action stay-istanbul-d2
    :parameters ()
    :precondition (and (at istanbul d1) (not (day-assigned d2)))
    :effect (and (at istanbul d2) (day-assigned d2))
  )
  (:action stay-istanbul-d3
    :parameters ()
    :precondition (and (at istanbul d2) (not (day-assigned d3)))
    :effect (and (at istanbul d3) (day-assigned d3))
  )
  (:action stay-istanbul-d4
    :parameters ()
    :precondition (and (at istanbul d3) (not (day-assigned d4)))
    :effect (and (at istanbul d4) (day-assigned d4))
  )
  (:action stay-istanbul-d5
    :parameters ()
    :precondition (and (at istanbul d4) (not (day-assigned d5)))
    :effect (and (at istanbul d5) (day-assigned d5))
  )
  (:action stay-istanbul-d6
    :parameters ()
    :precondition (and (at istanbul d5) (not (day-assigned d6)))
    :effect (and (at istanbul d6) (day-assigned d6))
  )
  (:action stay-istanbul-d7
    :parameters ()
    :precondition (and (at istanbul d6) (not (day-assigned d7)))
    :effect (and (at istanbul d7) (day-assigned d7))
  )

  (:action stay-salzburg-d2
    :parameters ()
    :precondition (and (at salzburg d1) (not (day-assigned d2)))
    :effect (and (at salzburg d2) (day-assigned d2))
  )
  (:action stay-salzburg-d3
    :parameters ()
    :precondition (and (at salzburg d2) (not (day-assigned d3)))
    :effect (and (at salzburg d3) (day-assigned d3))
  )
  (:action stay-salzburg-d4
    :parameters ()
    :precondition (and (at salzburg d3) (not (day-assigned d4)))
    :effect (and (at salzburg d4) (day-assigned d4))
  )
  (:action stay-salzburg-d5
    :parameters ()
    :precondition (and (at salzburg d4) (not (day-assigned d5)))
    :effect (and (at salzburg d5) (day-assigned d5))
  )
  (:action stay-salzburg-d6
    :parameters ()
    :precondition (and (at salzburg d5) (not (day-assigned d6)))
    :effect (and (at salzburg d6) (day-assigned d6))
  )
  (:action stay-salzburg-d7
    :parameters ()
    :precondition (and (at salzburg d6) (not (day-assigned d7)))
    :effect (and (at salzburg d7) (day-assigned d7))
  )

  (:action fly-paris-istanbul-d2
    :parameters ()
    :precondition (and (at paris d1) (not (day-assigned d2)))
    :effect (and (at istanbul d2) (day-assigned d2))
  )
  (:action fly-paris-istanbul-d3
    :parameters ()
    :precondition (and (at paris d2) (not (day-assigned d3)))
    :effect (and (at istanbul d3) (day-assigned d3))
  )
  (:action fly-paris-istanbul-d4
    :parameters ()
    :precondition (and (at paris d3) (not (day-assigned d4)))
    :effect (and (at istanbul d4) (day-assigned d4))
  )
  (:action fly-paris-istanbul-d5
    :parameters ()
    :precondition (and (at paris d4) (not (day-assigned d5)))
    :effect (and (at istanbul d5) (day-assigned d5))
  )
  (:action fly-paris-istanbul-d6
    :parameters ()
    :precondition (and (at paris d5) (not (day-assigned d6)))
    :effect (and (at istanbul d6) (day-assigned d6))
  )
  (:action fly-paris-istanbul-d7
    :parameters ()
    :precondition (and (at paris d6) (not (day-assigned d7)))
    :effect (and (at istanbul d7) (day-assigned d7))
  )

  (:action fly-istanbul-paris-d2
    :parameters ()
    :precondition (and (at istanbul d1) (not (day-assigned d2)))
    :effect (and (at paris d2) (day-assigned d2))
  )
  (:action fly-istanbul-paris-d3
    :parameters ()
    :precondition (and (at istanbul d2) (not (day-assigned d3)))
    :effect (and (at paris d3) (day-assigned d3))
  )
  (:action fly-istanbul-paris-d4
    :parameters ()
    :precondition (and (at istanbul d3) (not (day-assigned d4)))
    :effect (and (at paris d4) (day-assigned d4))
  )
  (:action fly-istanbul-paris-d5
    :parameters ()
    :precondition (and (at istanbul d4) (not (day-assigned d5)))
    :effect (and (at paris d5) (day-assigned d5))
  )
  (:action fly-istanbul-paris-d6
    :parameters ()
    :precondition (and (at istanbul d5) (not (day-assigned d6)))
    :effect (and (at paris d6) (day-assigned d6))
  )
  (:action fly-istanbul-paris-d7
    :parameters ()
    :precondition (and (at istanbul d6) (not (day-assigned d7)))
    :effect (and (at paris d7) (day-assigned d7))
  )

  (:action fly-istanbul-salzburg-d2
    :parameters ()
    :precondition (and (at istanbul d1) (not (day-assigned d2)))
    :effect (and (at salzburg d2) (day-assigned d2))
  )
  (:action fly-istanbul-salzburg-d3
    :parameters ()
    :precondition (and (at istanbul d2) (not (day-assigned d3)))
    :effect (and (at salzburg d3) (day-assigned d3))
  )
  (:action fly-istanbul-salzburg-d4
    :parameters ()
    :precondition (and (at istanbul d3) (not (day-assigned d4)))
    :effect (and (at salzburg d4) (day-assigned d4))
  )
  (:action fly-istanbul-salzburg-d5
    :parameters ()
    :precondition (and (at istanbul d4) (not (day-assigned d5)))
    :effect (and (at salzburg d5) (day-assigned d5))
  )
  (:action fly-istanbul-salzburg-d6
    :parameters ()
    :precondition (and (at istanbul d5) (not (day-assigned d6)))
    :effect (and (at salzburg d6) (day-assigned d6))
  )
  (:action fly-istanbul-salzburg-d7
    :parameters ()
    :precondition (and (at istanbul d6) (not (day-assigned d7)))
    :effect (and (at salzburg d7) (day-assigned d7))
  )

  (:action fly-salzburg-istanbul-d2
    :parameters ()
    :precondition (and (at salzburg d1) (not (day-assigned d2)))
    :effect (and (at istanbul d2) (day-assigned d2))
  )
  (:action fly-salzburg-istanbul-d3
    :parameters ()
    :precondition (and (at salzburg d2) (not (day-assigned d3)))
    :effect (and (at istanbul d3) (day-assigned d3))
  )
  (:action fly-salzburg-istanbul-d4
    :parameters ()
    :precondition (and (at salzburg d3) (not (day-assigned d4)))
    :effect (and (at istanbul d4) (day-assigned d4))
  )
  (:action fly-salzburg-istanbul-d5
    :parameters ()
    :precondition (and (at salzburg d4) (not (day-assigned d5)))
    :effect (and (at istanbul d5) (day-assigned d5))
  )
  (:action fly-salzburg-istanbul-d6
    :parameters ()
    :precondition (and (at salzburg d5) (not (day-assigned d6)))
    :effect (and (at istanbul d6) (day-assigned d6))
  )
  (:action fly-salzburg-istanbul-d7
    :parameters ()
    :precondition (and (at salzburg d6) (not (day-assigned d7)))
    :effect (and (at istanbul d7) (day-assigned d7))
  )
)