(define (domain jack_of_all_trades_trip)
  (:requirements :typing :negative-preconditions :strips)
  (:types city day token)

  (:predicates
    (unassigned ?d - day)
    (at ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (direct_flight ?c1 - city ?c2 - city)
    (token_open ?t - token)
    (token_used ?t - token)
    (token_for ?t - token ?c - city)
    (first_day ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city ?d - day ?t - token)
    :precondition (and
      (unassigned ?d)
      (token_open ?t)
      (token_for ?t ?c)
      (first_day ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?c ?d)
      (not (token_open ?t))
      (token_used ?t)
    )
  )

  (:action stay_assign
    :parameters (?c - city ?d_prev - day ?d_next - day ?t - token)
    :precondition (and
      (at ?c ?d_prev)
      (succ ?d_prev ?d_next)
      (unassigned ?d_next)
      (token_open ?t)
      (token_for ?t ?c)
    )
    :effect (and
      (not (unassigned ?d_next))
      (at ?c ?d_next)
      (not (token_open ?t))
      (token_used ?t)
    )
  )

  (:action fly_assign
    :parameters (?from - city ?to - city ?d_prev - day ?d_next - day ?t - token)
    :precondition (and
      (at ?from ?d_prev)
      (succ ?d_prev ?d_next)
      (unassigned ?d_next)
      (direct_flight ?from ?to)
      (token_open ?t)
      (token_for ?t ?to)
    )
    :effect (and
      (not (unassigned ?d_next))
      (at ?to ?d_next)
      (not (token_open ?t))
      (token_used ?t)
    )
  )
)