(define (domain trip_planning_example13)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (today ?d - day)
    (in_lyon_window ?d - day)

    (stayed_manchester ?d - day)
    (stayed_bucharest ?d - day)
    (stayed_lyon ?d - day)

    (visited_relatives)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (today d1)
      (not (at manchester))
      (not (at bucharest))
      (not (at lyon))
    )
    :effect (at ?c)
  )

  (:action stay_manchester
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at manchester)
      (today ?d1)
      (next_day ?d1 ?d2)
      (not (stayed_manchester ?d1))
      (not (stayed_bucharest ?d1))
      (not (stayed_lyon ?d1))
    )
    :effect (and
      (stayed_manchester ?d1)
      (not (today ?d1))
      (today ?d2)
    )
  )

  (:action stay_bucharest
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at bucharest)
      (today ?d1)
      (next_day ?d1 ?d2)
      (not (stayed_manchester ?d1))
      (not (stayed_bucharest ?d1))
      (not (stayed_lyon ?d1))
    )
    :effect (and
      (stayed_bucharest ?d1)
      (not (today ?d1))
      (today ?d2)
    )
  )

  (:action stay_lyon
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at lyon)
      (today ?d1)
      (next_day ?d1 ?d2)
      (not (stayed_manchester ?d1))
      (not (stayed_bucharest ?d1))
      (not (stayed_lyon ?d1))
    )
    :effect (and
      (stayed_lyon ?d1)
      (not (today ?d1))
      (today ?d2)
    )
  )

  (:action visit_relatives_while_in_lyon
    :parameters (?d - day)
    :precondition (and
      (at lyon)
      (today ?d)
      (in_lyon_window ?d)
      (not (visited_relatives))
    )
    :effect (visited_relatives)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)