(define (domain trip-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (day-assigned ?d - day)
  )

  ;--------------------------
  ; Stay actions (stay in same city from previous day -> assign current day)
  ; One action per city and target day (days 2..7). Preconditions require previous day occupancy.
  ;--------------------------
  (:action stay-paris-d2
    :precondition (and (at paris d1) (not (day-assigned d2)))
    :effect (and (at paris d2) (day-assigned d2))
  )
  (:action stay-paris-d3
    :precondition (and (at paris d2) (not (day-assigned d3)))
    :effect (and (at paris d3) (day-assigned d3))
  )
  (:action stay-paris-d4
    :precondition (and (at paris d3) (not (day-assigned d4)))
    :effect (and (at paris d4) (day-assigned d4))
  )
  (:action stay-paris-d5
    :precondition (and (at paris d4) (not (day-assigned d5)))
    :effect (and (at paris d5) (day-assigned d5))
  )
  (:action stay-paris-d6
    :precondition (and (at paris d5) (not (day-assigned d6)))
    :effect (and (at paris d6) (day-assigned d6))
  )
  (:action stay-paris-d7
    :precondition (and (at paris d6) (not (day-assigned d7)))
    :effect (and (at paris d7) (day-assigned d7))
  )

  (:action stay-istanbul-d2
    :precondition (and (at istanbul d1) (not (day-assigned d2)))
    :effect (and (at istanbul d2) (day-assigned d2))
  )
  (:action stay-istanbul-d3
    :precondition (and (at istanbul d2) (not (day-assigned d3)))
    :effect (and (at istanbul d3) (day-assigned d3))
  )
  (:action stay-istanbul-d4
    :precondition (and (at istanbul d3) (not (day-assigned d4)))
    :effect (and (at istanbul d4) (day-assigned d4))
  )
  (:action stay-istanbul-d5
    :precondition (and (at istanbul d4) (not (day-assigned d5)))
    :effect (and (at istanbul d5) (day-assigned d5))
  )
  (:action stay-istanbul-d6
    :precondition (and (at istanbul d5) (not (day-assigned d6)))
    :effect (and (at istanbul d6) (day-assigned d6))
  )
  (:action stay-istanbul-d7
    :precondition (and (at istanbul d6) (not (day-assigned d7)))
    :effect (and (at istanbul d7) (day-assigned d7))
  )

  (:action stay-salzburg-d2
    :precondition (and (at salzburg d1) (not (day-assigned d2)))
    :effect (and (at salzburg d2) (day-assigned d2))
  )
  (:action stay-salzburg-d3
    :precondition (and (at salzburg d2) (not (day-assigned d3)))
    :effect (and (at salzburg d3) (day-assigned d3))
  )
  (:action stay-salzburg-d4
    :precondition (and (at salzburg d3) (not (day-assigned d4)))
    :effect (and (at salzburg d4) (day-assigned d4))
  )
  (:action stay-salzburg-d5
    :precondition (and (at salzburg d4) (not (day-assigned d5)))
    :effect (and (at salzburg d5) (day-assigned d5))
  )
  (:action stay-salzburg-d6
    :precondition (and (at salzburg d5) (not (day-assigned d6)))
    :effect (and (at salzburg d6) (day-assigned d6))
  )
  (:action stay-salzburg-d7
    :precondition (and (at salzburg d6) (not (day-assigned d7)))
    :effect (and (at salzburg d7) (day-assigned d7))
  )

  ;--------------------------
  ; Flight actions (only direct flights allowed)
  ; Direct flights available: Paris <-> Istanbul, Istanbul <-> Salzburg.
  ; For each flight, day N arrival is assigned if previous day (N-1) was at origin.
  ; No Paris <-> Salzburg flight action is provided (explicitly disallowed by data).
  ;--------------------------
  ; Paris <-> Istanbul (days 2..7 arrivals)
  (:action fly-paris-istanbul-d2
    :precondition (and (at paris d1) (not (day-assigned d2)))
    :effect (and (at istanbul d2) (day-assigned d2))
  )
  (:action fly-paris-istanbul-d3
    :precondition (and (at paris d2) (not (day-assigned d3)))
    :effect (and (at istanbul d3) (day-assigned d3))
  )
  (:action fly-paris-istanbul-d4
    :precondition (and (at paris d3) (not (day-assigned d4)))
    :effect (and (at istanbul d4) (day-assigned d4))
  )
  (:action fly-paris-istanbul-d5
    :precondition (and (at paris d4) (not (day-assigned d5)))
    :effect (and (at istanbul d5) (day-assigned d5))
  )
  (:action fly-paris-istanbul-d6
    :precondition (and (at paris d5) (not (day-assigned d6)))
    :effect (and (at istanbul d6) (day-assigned d6))
  )
  (:action fly-paris-istanbul-d7
    :precondition (and (at paris d6) (not (day-assigned d7)))
    :effect (and (at istanbul d7) (day-assigned d7))
  )

  (:action fly-istanbul-paris-d2
    :precondition (and (at istanbul d1) (not (day-assigned d2)))
    :effect (and (at paris d2) (day-assigned d2))
  )
  (:action fly-istanbul-paris-d3
    :precondition (and (at istanbul d2) (not (day-assigned d3)))
    :effect (and (at paris d3) (day-assigned d3))
  )
  (:action fly-istanbul-paris-d4
    :precondition (and (at istanbul d3) (not (day-assigned d4)))
    :effect (and (at paris d4) (day-assigned d4))
  )
  (:action fly-istanbul-paris-d5
    :precondition (and (at istanbul d4) (not (day-assigned d5)))
    :effect (and (at paris d5) (day-assigned d5))
  )
  (:action fly-istanbul-paris-d6
    :precondition (and (at istanbul d5) (not (day-assigned d6)))
    :effect (and (at paris d6) (day-assigned d6))
  )
  (:action fly-istanbul-paris-d7
    :precondition (and (at istanbul d6) (not (day-assigned d7)))
    :effect (and (at paris d7) (day-assigned d7))
  )

  ; Istanbul <-> Salzburg (days 2..7 arrivals)
  (:action fly-istanbul-salzburg-d2
    :precondition (and (at istanbul d1) (not (day-assigned d2)))
    :effect (and (at salzburg d2) (day-assigned d2))
  )
  (:action fly-istanbul-salzburg-d3
    :precondition (and (at istanbul d2) (not (day-assigned d3)))
    :effect (and (at salzburg d3) (day-assigned d3))
  )
  (:action fly-istanbul-salzburg-d4
    :precondition (and (at istanbul d3) (not (day-assigned d4)))
    :effect (and (at salzburg d4) (day-assigned d4))
  )
  (:action fly-istanbul-salzburg-d5
    :precondition (and (at istanbul d4) (not (day-assigned d5)))
    :effect (and (at salzburg d5) (day-assigned d5))
  )
  (:action fly-istanbul-salzburg-d6
    :precondition (and (at istanbul d5) (not (day-assigned d6)))
    :effect (and (at salzburg d6) (day-assigned d6))
  )
  (:action fly-istanbul-salzburg-d7
    :precondition (and (at istanbul d6) (not (day-assigned d7)))
    :effect (and (at salzburg d7) (day-assigned d7))
  )

  (:action fly-salzburg-istanbul-d2
    :precondition (and (at salzburg d1) (not (day-assigned d2)))
    :effect (and (at istanbul d2) (day-assigned d2))
  )
  (:action fly-salzburg-istanbul-d3
    :precondition (and (at salzburg d2) (not (day-assigned d3)))
    :effect (and (at istanbul d3) (day-assigned d3))
  )
  (:action fly-salzburg-istanbul-d4
    :precondition (and (at salzburg d3) (not (day-assigned d4)))
    :effect (and (at istanbul d4) (day-assigned d4))
  )
  (:action fly-salzburg-istanbul-d5
    :precondition (and (at salzburg d4) (not (day-assigned d5)))
    :effect (and (at istanbul d5) (day-assigned d5))
  )
  (:action fly-salzburg-istanbul-d6
    :precondition (and (at salzburg d5) (not (day-assigned d6)))
    :effect (and (at istanbul d6) (day-assigned d6))
  )
  (:action fly-salzburg-istanbul-d7
    :precondition (and (at salzburg d6) (not (day-assigned d7)))
    :effect (and (at istanbul d7) (day-assigned d7))
  )

)