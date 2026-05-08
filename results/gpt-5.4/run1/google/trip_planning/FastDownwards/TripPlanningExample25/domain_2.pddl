(define (domain tripplanningexample25_domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city ?d - day)

    (started)

    (visited_valencia)
    (visited_lyon)
    (visited_split)

    (left_valencia)
    (left_lyon)

    (final_day ?d - day)
  )

  (:action start_in_valencia
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (started))
    )
    :effect (and
      (started)
      (at valencia d1)
      (visited_valencia)
    )
  )

  (:action start_in_lyon
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (started))
    )
    :effect (and
      (started)
      (at lyon d1)
      (visited_lyon)
    )
  )

  (:action start_in_split
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (started))
    )
    :effect (and
      (started)
      (at split d1)
      (visited_split)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (started)
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
      (when_dummy)
    )
  )
)