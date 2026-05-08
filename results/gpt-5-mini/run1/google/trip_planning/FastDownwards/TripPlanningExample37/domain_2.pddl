(define (domain jack_of_all_trades_trip)
  (:requirements :typing :negative-preconditions :strips)
  (:types city day req_token)

  (:predicates
    (unassigned ?d - day)
    (at ?c - city ?d - day)
    (succ ?d1 - day ?d2 - day)
    (direct_flight ?c1 - city ?c2 - city)
    (req_open ?r - req_token)
    (req_satisfied ?r - req_token)
    (req_for ?r - req_token ?c - city)
    (first_day ?d - day)
  )

  ;; Start the trip by assigning the first day to a city (consumes one req_token for that city).
  (:action start-in-city
    :parameters (?c - city ?d - day ?r - req_token)
    :precondition (and
      (unassigned ?d)
      (req_open ?r)
      (req_for ?r ?c)
      (first_day ?d)
    )
    :effect (and
      (not (unassigned ?d))
      (at ?c ?d)
      (not (req_open ?r))
      (req_satisfied ?r)
    )
  )

  ;; Stay in the same city on the next day (consumes one req_token for that city).
  (:action stay_assign
    :parameters (?c - city ?d_prev - day ?d_next - day ?r - req_token)
    :precondition (and
      (at ?c ?d_prev)
      (succ ?d_prev ?d_next)
      (unassigned ?d_next)
      (req_open ?r)
      (req_for ?r ?c)
    )
    :effect (and
      (not (unassigned ?d_next))
      (at ?c ?d_next)
      (not (req_open ?r))
      (req_satisfied ?r)
    )
  )

  ;; Fly from one city to a directly connected city for the next day (consumes one req_token for destination).
  (:action fly_assign
    :parameters (?from - city ?to - city ?d_prev - day ?d_next - day ?r - req_token)
    :precondition (and
      (at ?from ?d_prev)
      (succ ?d_prev ?d_next)
      (unassigned ?d_next)
      (direct_flight ?from ?to)
      (req_open ?r)
      (req_for ?r ?to)
    )
    :effect (and
      (not (unassigned ?d_next))
      (at ?to ?d_next)
      (not (req_open ?r))
      (req_satisfied ?r)
    )
  )
)