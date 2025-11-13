(define (domain travel)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)

  (:predicates
    (next ?d1 - day ?d2 - day)        ; consecutive days: can act between ?d1 and ?d2
    (at ?d - day ?c - city)          ; you are in city on day
    (assigned ?d - day)              ; day already assigned a city
    (adjacent ?c1 - city ?c2 - city) ; direct flight exists between cities
  )

  ;; Stay in the same city from day ?d1 to the next day ?d2.
  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  ;; Fly between adjacent cities from day ?d1 to the next day ?d2.
  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (at ?d1 ?from)
      (adjacent ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
    )
  )
)