(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)             ; agent is in city ?c on day ?d
    (succ ?d1 - day ?d2 - day)         ; ?d2 is immediate successor of ?d1
    (assigned ?d - day)                ; day ?d has been consumed/assigned
    (direct ?from - city ?to - city)   ; there is a direct flight from ?from to ?to
    (visited ?c - city)                ; city ?c has been visited already
  )

  ;; Stay: remain in the same city for the next contiguous day.
  ;; Preconditions enforce contiguous progression and that the next day has not been consumed.
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
    )
  )

  ;; Fly: move to a directly reachable, not-yet-visited city, arriving on the next contiguous day.
  ;; Preconditions prevent revisiting and enforce contiguous day consumption.
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
    )
  )
)