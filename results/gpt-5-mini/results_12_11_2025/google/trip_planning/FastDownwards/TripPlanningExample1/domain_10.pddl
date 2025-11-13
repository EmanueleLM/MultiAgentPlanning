(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at_city ?c - city)                 ; traveler currently located in city ?c
    (at_day ?d - day)                   ; current day pointer is ?d
    (succ ?d1 - day ?d2 - day)          ; ?d2 is the immediate successor of ?d1
    (assigned ?d - day)                 ; day ?d has been consumed/assigned
    (occ ?c - city ?d - day)            ; city ?c is occupied on day ?d
    (direct ?from - city ?to - city)    ; direct flight edge from ?from to ?to
    (visited ?c - city)                 ; city ?c has been visited (prevents revisits)
  )

  ;; Stay in the same city and advance one day.
  ;; Requires being at the current day and the next day unassigned.
  ;; Effects advance the day pointer, mark the new day assigned, record occupancy, and mark city visited.
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at_city ?c)
      (at_day ?d1)
      (succ ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at_day ?d2)
      (not (at_day ?d1))
      (assigned ?d2)
      (occ ?c ?d2)
      (visited ?c)
    )
  )

  ;; Fly from one city to another, arriving on the successor day.
  ;; Destination must be directly reachable and not previously visited (single-pass visit).
  ;; Arrival consumes the successor day and records occupancy and visitation.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at_city ?from)
      (at_day ?d1)
      (succ ?d1 ?d2)
      (direct ?from ?to)
      (not (assigned ?d2))
      (not (visited ?to))
    )
    :effect (and
      (at_city ?to)
      (not (at_city ?from))
      (at_day ?d2)
      (not (at_day ?d1))
      (assigned ?d2)
      (occ ?to ?d2)
      (visited ?to)
    )
  )
)