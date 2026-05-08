(define (domain travel_multiagent)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city day)
  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (occupied ?d - day)
    (connected ?c1 - city ?c2 - city)
    (meeting_window ?d - day)
    (met_friends)
    (is_bucharest ?c - city)
  )
  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
    )
  )
  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
    )
  )
  (:action meet
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c ?d)
      (meeting_window ?d)
      (is_bucharest ?c)
      (not (met_friends))
    )
    :effect (met_friends)
  )
)