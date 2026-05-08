(define (domain trip_planning_example13)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
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
    (started)
  )

  (:action start_in_manchester
    :parameters ()
    :precondition (and
      (today d1)
      (not (started))
      (not (at manchester))
      (not (at bucharest))
      (not (at lyon))
    )
    :effect (and
      (at manchester)
      (started)
    )
  )

  (:action start_in_bucharest
    :parameters ()
    :precondition (and
      (today d1)
      (not (started))
      (not (at manchester))
      (not (at bucharest))
      (not (at lyon))
    )
    :effect (and
      (at bucharest)
      (started)
    )
  )

  (:action start_in_lyon
    :parameters ()
    :precondition (and
      (today d1)
      (not (started))
      (not (at manchester))
      (not (at bucharest))
      (not (at lyon))
    )
    :effect (and
      (at lyon)
      (started)
    )
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

  (:action fly_manchester_bucharest
    :parameters ()
    :precondition (and
      (at manchester)
      (direct manchester bucharest)
    )
    :effect (and
      (not (at manchester))
      (at bucharest)
    )
  )

  (:action fly_bucharest_manchester
    :parameters ()
    :precondition (and
      (at bucharest)
      (direct bucharest manchester)
    )
    :effect (and
      (not (at bucharest))
      (at manchester)
    )
  )

  (:action fly_bucharest_lyon
    :parameters ()
    :precondition (and
      (at bucharest)
      (direct bucharest lyon)
    )
    :effect (and
      (not (at bucharest))
      (at lyon)
    )
  )

  (:action fly_lyon_bucharest
    :parameters ()
    :precondition (and
      (at lyon)
      (direct lyon bucharest)
    )
    :effect (and
      (not (at lyon))
      (at bucharest)
    )
  )
)