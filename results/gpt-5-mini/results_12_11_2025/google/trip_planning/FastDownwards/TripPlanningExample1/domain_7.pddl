(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)             ; traveler is in city ?c on day ?d
    (succ ?d1 - day ?d2 - day)         ; ?d2 is immediate successor of ?d1
    (assigned ?d - day)                ; day ?d has been consumed/assigned
    (direct ?from - city ?to - city)   ; there is a direct flight from ?from to ?to
    (visited ?c - city)                ; city ?c has been visited already
  )

  ;; Stay in the same city for the next day (consumes one contiguous day)
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (succ ?d1 ?d2)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?d2)
      (visited ?c)
      (not (at ?c ?d1))
    )
  )

  ;; Fly from one city to another on the next day (consumes that next day)
  ;; Only allowed if there is a direct flight and the destination has not yet been visited,
  ;; enforcing a single-pass visit of each city and preventing oscillation.
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (succ ?d1 ?d2)
      (direct ?from ?to)
      (not (assigned ?d2))
      (not (visited ?to))
    )
    :effect (and
      (at ?to ?d2)
      (assigned ?d2)
      (visited ?to)
      (not (at ?from ?d1))
    )
  )
)