(define (domain tripplanningexample25)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
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
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (started))
      (not (at valencia))
      (not (at lyon))
      (not (at split))
      (not (visited d1 valencia))
      (not (visited d1 lyon))
      (not (visited d1 split))
    )
    :effect (and
      (started)
      (at valencia)
      (visited d1 valencia)
    )
  )

  (:action start_in_lyon
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (started))
      (not (at valencia))
      (not (at lyon))
      (not (at split))
      (not (visited d1 valencia))
      (not (visited d1 lyon))
      (not (visited d1 split))
    )
    :effect (and
      (started)
      (at lyon)
      (visited d1 lyon)
    )
  )

  (:action start_in_split
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (started))
      (not (at valencia))
      (not (at lyon))
      (not (at split))
      (not (visited d1 valencia))
      (not (visited d1 lyon))
      (not (visited d1 split))
    )
    :effect (and
      (started)
      (at split)
      (visited d1 split)
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
      (not (= ?from ?to))
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