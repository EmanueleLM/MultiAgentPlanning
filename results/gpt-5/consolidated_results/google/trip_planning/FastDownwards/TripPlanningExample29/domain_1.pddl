(define (domain trip-planning-10days)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (current ?d - day)              ; pointer to the current day
    (succ ?d - day ?n - day)        ; successor relation between days
    (at ?c - city)                  ; current city (for taking a stay or flight)
    (in ?d - day ?c - city)         ; assignment: on day d, you are in city c
    (assigned ?d - day)             ; day d has been assigned to some city
    (direct ?from - city ?to - city); direct flight connectivity
    (visited ?c - city)             ; city has been visited at least once
  )

  (:action stay
    :parameters (?d - day ?n - day ?c - city)
    :precondition (and
      (current ?d)
      (succ ?d ?n)
      (at ?c)
      (not (assigned ?n))
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (in ?n ?c)
      (assigned ?n)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?d - day ?n - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (succ ?d ?n)
      (at ?from)
      (direct ?from ?to)
      (not (assigned ?n))
    )
    :effect (and
      (not (current ?d))
      (current ?n)
      (not (at ?from))
      (at ?to)
      (in ?n ?to)
      (assigned ?n)
      (visited ?to)
    )
  )
)