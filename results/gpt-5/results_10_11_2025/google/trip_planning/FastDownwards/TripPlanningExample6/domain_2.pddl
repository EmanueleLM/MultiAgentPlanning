(define (domain trip-days)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (at ?d - day ?c - city)        ; city assigned for a given day
    (next ?d - day ?d2 - day)      ; successor relation between days
    (connected ?c - city ?c2 - city) ; direct-flight adjacency only
    (assigned ?d - day)            ; day has been assigned exactly once
    (frontier ?d - day)            ; current latest assigned day in sequence
  )

  ; Stay in the same city from day d to the next day d2
  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
      (not (frontier ?d))
      (frontier ?d2)
    )
  )

  ; Fly between directly connected cities from day d to the next day d2
  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (frontier ?d)
      (next ?d ?d2)
      (at ?d ?from)
      (connected ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
      (not (frontier ?d))
      (frontier ?d2)
    )
  )
)