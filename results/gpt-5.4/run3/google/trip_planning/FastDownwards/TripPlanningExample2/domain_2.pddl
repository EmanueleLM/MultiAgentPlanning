(define (domain tripplanningexample2)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (started)
    (finished)
  )

  (:action start_in_reykjavik
    :parameters ()
    :precondition (not (started))
    :effect (and
      (started)
      (current_day d1)
      (at reykjavik d1))
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at reykjavik ?d2))
      (not (at vienna ?d2))
      (not (at venice ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (not (finished))
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at reykjavik ?d2))
      (not (at vienna ?d2))
      (not (at venice ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2))
  )

  (:action finish
    :parameters ()
    :precondition (and
      (started)
      (not (finished))
      (current_day d11)
      (at reykjavik d1)
      (at reykjavik d2)
      (at vienna d3)
      (at vienna d4)
      (at vienna d5)
      (at vienna d6)
      (at vienna d7)
      (at vienna d8)
      (at vienna d9)
      (at venice d8)
      (at venice d9)
      (at venice d10)
      (at venice d11))
    :effect (finished))
)