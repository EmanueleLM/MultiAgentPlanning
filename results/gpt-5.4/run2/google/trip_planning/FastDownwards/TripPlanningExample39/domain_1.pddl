(define (domain tripplanningexample39)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (start_day ?d - day)
    (porto_window_day ?d - day)
    (spent ?d - day ?c - city)
  )

  (:action start_in_city
    :parameters (?c - city ?d - day)
    :precondition (and
      (start_day ?d)
      (today ?d)
      (at ?c)
      (not (spent ?d porto))
      (not (spent ?d barcelona))
      (not (spent ?d florence))
    )
    :effect (spent ?d ?c)
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (today ?d1)
      (next ?d1 ?d2)
      (spent ?d1 ?c)
      (not (spent ?d2 porto))
      (not (spent ?d2 barcelona))
      (not (spent ?d2 florence))
    )
    :effect (and
      (not (today ?d1))
      (today ?d2)
      (spent ?d2 ?c)
    )
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (today ?d1)
      (next ?d1 ?d2)
      (spent ?d1 ?from)
      (direct_flight ?from ?to)
      (not (spent ?d2 porto))
      (not (spent ?d2 barcelona))
      (not (spent ?d2 florence))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (today ?d1))
      (today ?d2)
      (spent ?d2 ?to)
    )
  )
)