(define (domain trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (succ ?d1 - day ?d2 - day)    ; successor relation: night d1 -> d2
    (at ?d - day ?c - city)      ; traveler is in city on day
    (assigned ?d - day)          ; day already assigned a location (prevents double-assignment)
    (direct ?c1 - city ?c2 - city) ; direct flight exists between cities (bidirectional facts can be provided)
  )

  ;; Stay in same city across the night from ?d to ?d2 (no flight that night).
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (succ ?d ?d2)
      (at ?d ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  ;; Take a direct flight on the night from ?d to ?d2, moving from ?from to ?to.
  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (succ ?d ?d2)
      (at ?d ?from)
      (direct ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
    )
  )
)