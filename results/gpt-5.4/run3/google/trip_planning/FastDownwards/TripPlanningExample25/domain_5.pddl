(define (domain tripplanningexample25)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    valencia lyon split - city
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?d - day ?c - city)
    (started)
  )

  (:action start_in_valencia
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (started))
      (not (at valencia))
      (not (at lyon))
      (not (at split))
      (not (visited ?d valencia))
      (not (visited ?d lyon))
      (not (visited ?d split))
    )
    :effect (and
      (started)
      (at valencia)
      (visited ?d valencia)
    )
  )

  (:action start_in_lyon
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (started))
      (not (at valencia))
      (not (at lyon))
      (not (at split))
      (not (visited ?d valencia))
      (not (visited ?d lyon))
      (not (visited ?d split))
    )
    :effect (and
      (started)
      (at lyon)
      (visited ?d lyon)
    )
  )

  (:action start_in_split
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (not (started))
      (not (at valencia))
      (not (at lyon))
      (not (at split))
      (not (visited ?d valencia))
      (not (visited ?d lyon))
      (not (visited ?d split))
    )
    :effect (and
      (started)
      (at split)
      (visited ?d split)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited ?d2 valencia))
      (not (visited ?d2 lyon))
      (not (visited ?d2 split))
    )
    :effect (and
      (visited ?d2 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited ?d2 valencia))
      (not (visited ?d2 lyon))
      (not (visited ?d2 split))
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)