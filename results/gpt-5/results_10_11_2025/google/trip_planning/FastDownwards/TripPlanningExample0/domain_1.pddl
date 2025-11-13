(define (domain tripplanningexample0-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (window ?d - day)
    (reached ?d - day)
    (visited ?c - city)
    (met)
  )

  ; Stay in the same city and advance to the next day
  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and (at ?c ?d) (next ?d ?d2))
    :effect (and
      (not (at ?c ?d))
      (at ?c ?d2)
      (reached ?d2)
      (visited ?c)
    )
  )

  ; Fly between directly connected cities and advance to the next day
  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from ?d)
      (next ?d ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from ?d))
      (at ?to ?d2)
      (reached ?d2)
      (visited ?to)
    )
  )

  ; Meet the friend in Florence on a window day, also advancing a day (counts as a stay)
  (:action meet-in-florence
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at florence ?d)
      (next ?d ?d2)
      (window ?d)
      (not (met))
    )
    :effect (and
      (not (at florence ?d))
      (at florence ?d2)
      (reached ?d2)
      (visited florence)
      (met)
    )
  )
)