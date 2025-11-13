(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at_city ?c - city)                 ; traveler is currently located in city ?c (single-valued)
    (at_day ?d - day)                   ; current day pointer is ?d
    (succ ?d1 - day ?d2 - day)          ; ?d2 is the immediate successor of ?d1
    (assigned ?d - day)                 ; day ?d has been consumed/assigned (persistent)
    (occ ?c - city ?d - day)            ; city ?c is occupied on day ?d (persistent)
    (direct ?from - city ?to - city)    ; direct flight edge from ?from to ?to
    (visited ?c - city)                 ; city ?c has been visited (persistent)
  )

  ;; Stay in the same city for the next day.
  ;; Advances the global day pointer by one (succ), marks that next day assigned and occupied by same city.
  ;; Does NOT remove any occ or assigned facts (they are persistent), ensuring day-by-day records accumulate.
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
      (assigned ?d2)
      (occ ?c ?d2)
      (not (at_day ?d1))
    )
  )

  ;; Fly from one city to another on the next day (arrival on the successor day).
  ;; Only allowed if there is a direct flight and the destination has not yet been visited,
  ;; preventing revisits and enforcing a single-pass visit to each city.
  ;; Consumes the next day (marks assigned and occ at arrival).
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