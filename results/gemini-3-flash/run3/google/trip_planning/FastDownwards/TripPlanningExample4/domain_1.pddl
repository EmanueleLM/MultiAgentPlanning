(define (domain trip_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day count)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 ?d2 - day)
    (stay_count ?c - city ?n - count)
    (next_count ?n1 ?n2 - count)
    (at_day ?c - city ?d - day)
    (flight ?c1 ?c2 - city)
    (started)
  )

  (:action select_start_city
    :parameters (?c - city)
    :precondition (and (not (started)))
    :effect (and (started) (at ?c))
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day ?n - count ?nn - count)
    :precondition (and
      (started)
      (at ?c)
      (current_day ?d)
      (next_day ?d ?nd)
      (stay_count ?c ?n)
      (next_count ?n ?nn)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?nd)
      (not (stay_count ?c ?n))
      (stay_count ?c ?nn)
      (at_day ?c ?d)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (started)
      (at ?from)
      (flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)